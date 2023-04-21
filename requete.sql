--1
/*
fonction/procedure qui deduit une ou plusieurs maladies a partir d'un
symptome, classees de la plus specifique a la plus generique
*/

select m.nom
from maladies m
inner join deduit d on d.idmaladies = m.id
where d.idobservation = 3 /*<-MODIFIER ICI L'ID Du SYMPTONE*/
order by m.id desc;


--2
/*
fonction/procedure qui permet de proposer une liste de medicaments a
partir d'une maladie. Si un lien maladie-medicament n'existe pas, il faudra
remonter dans la hierarchie des maladies jusqu'a trouver un medicament a
proposer. Pour chaque medicament, l'url d'acces a la notice sera egalement
fournie en sortie
*/

SET SERVEROUTPUT ON;
DECLARE
  v_id  varchar2(150) := 'C01.252.200.100.122'/*<-MODIFIER ICI L'ID DE LA MALADIE*/;
  v_count number := 0;
begin
  loop
    select count(*) into v_count from indication i where i.idMaladies = v_id;
    if v_count > 0 then
        For med_rec
        in (select distinct me.nom
            from medicament me
            where me.id in (select i.idMedicament from indication i where i.idMaladies = v_id))
        loop
          dbms_output.put_line(med_rec.nom);
        end loop;
        EXIT;
    end if;
    if LENGTH(v_id)<2 then
      EXIT;
    end if;
    select replace(v_id, regexp_substr(v_id,'\.?[0-9]*$',1,1)) into v_id from dual;
  end loop;
end;


--3
/*
fonction/procedure qui permet de sauvegarder le patient, son traitement
(l'ensemble du ou des medicaments et/ou recommandations) et la ou les maladies
diagnostiquees par un medecin. Pour controler les prescriptions, le systeme
ne doit pas autoriser un medecin a prescrire un medicament pour lequel
il a participe l'elaboration.
*/

create or replace trigger verifPrescription
before insert on prescript
for each row
declare
    id_med int;
    nb_medicament number := 0;
begin
    select idMedecin into id_med
    from consultation
    where id = (select idConsultation
                from observation
                where id = :new.idObservation);
    select count(*) into nb_medicament
    from developpe
    where idMedecin = id_med
    and idMedicament in (select idMedicament
                         from constitue
                         where idTraitement = :new.idTraitement);
    if (nb_medicament > 0) then
        RAISE_APPLICATION_ERROR(-20001, 'Le medecin numero ' || id_med || ' ne peut pas prescrire le medicament pour lequel il a participe a l laboration!');
    end if;
exception
    WHEN NO_DATA_FOUND THEN NULL;
end;
/

--4
/*
fonction/procedure qui determine pour un medicament la liste des effets indesirables connus et possibles qui seront deduits a partir des hierarchies des classes chimiques et des classes pharmacologiques des substances actives.
*/

DECLARE
  id_medicament int := 3/*<-MODIFIER ICI L'ID DU MEDICAMENT*/;
begin
  For subs
  in (select distinct sa.nom, sa.id
      from possedeSA psa, SubstanceActive sa
      where psa.idMedicament = id_medicament and sa.id = psa.idSubstanceActive)
  loop
    dbms_output.put_line('-substance ' || subs.nom || ':');
    For effet0
    in (select ei.id, ei.description, ei.frequence
    	from effetIndesirable ei, genereSA gSA
    	where gSA.idEffet = ei.id and gSA.idSubstanceActive = subs.id)
    loop
    	dbms_output.put_line('--Effet numero '||effet0.id || ' ');
    end loop;
    dbms_output.put_line('classes Pharmacologiques:');
    For classesP
    in (select distinct cp.id, cp.nom
        from appartientCP acp, classePharmacologique cp
        where acp.idSubstanceActive = subs.id and acp.idclassePharmacologique = cp.id)
    loop
      dbms_output.put_line(classesP.nom || ' :');
      For effet1
      in (select ei.id
	from effetIndesirable ei
	where ei.id in 
	(select gCP.idEffet 
	from genereCP gCP
	where gCP.idClassePharmacologique in 
		(select CP.id 
		from classePharmacologique CP 
		START WITH CP.id = classesP.id /* idclassepharma */
		connect by prior CP.idparent = CP.id)))
      loop
        dbms_output.put_line('--Effet numero '||effet1.id || ' ');
      end loop;
    end loop;
    dbms_output.put_line(' classes Chimiques:');
    For classesC
    in (select distinct cc.id, cc.nom
        from appartientCC acc
        NATURAL JOIN classeChimique cc
        where acc.idSubstanceActive = subs.id)
    loop
      dbms_output.put_line(classesC.nom || ' :');
      For effet2
      in (select ei.id
	from effetIndesirable ei
	where ei.id in 
	(select gCC.idEffet 
	from genereCC gCC
	where gCC.idClasseChimique in 
		(select CC.id 
		from classeChimique CC
		START WITH CC.id = classesC.id /* idclasseChimi */
		connect by prior CC.idparent = CC.id)))
      loop
        dbms_output.put_line('--Effet numero '||effet2.id || ' ');
      end loop;
    end loop;
  end loop;
end;

--5
/*
fonction/procedure qui permet pour chaque medecin de connaitre la liste
de tous les medicaments qu'il a prescrits.
*/
select ide "id medecin", mednom "nom medecin", LISTAGG(names, ', ') WITHIN GROUP (ORDER BY names) "Medicament"
from (select distinct me.id ide, m.nom names, me.nom mednom
from medicament m
inner join constitue c on c.idMedicament = m.id
    inner join traitement t on t.id = c.idTraitement
    inner join prescript p on p.idTraitement = t.id
    inner join observation o on o.id = p.idObservation
    inner join consultation c2 on c2.id = o.idConsultation
    inner join medecin me on me.id = c2.idMedecin)
GROUP BY ide, mednom
ORDER BY ide;
