select Idmat, SUM(quantityMQ*quantityOr) as MatItog from composition join (product join orderspec on product.IDproduct=orderspec.IDproduct) on composition.IDproduct=product.IDproduct where orderspec.IDorder=21 group by Idmat;

-- select material.Idmat, SUM(QuantitySup) as Sup, SUM(quantityRel) as rel from supplyspec right join (material left join releasespec on material.Idmat=releasespec.Idmat) on supplyspec.Idmat=material.Idmat group by material.Idmat;
select material.Idmat, (IF(SUM(QuantitySup) IS NULL, 0, SUM(QuantitySup)) - IF(SUM(quantityRel) IS NULL, 0, SUM(quantityRel))) as itog from supplyspec right join (material left join releasespec on material.Idmat=releasespec.Idmat) on supplyspec.Idmat=material.Idmat group by material.Idmat;

select q1.Idmat, MatItog, itog, IF(itog<MatItog, MatItog-itog, 0) as nado from
(select Idmat, SUM(quantityMQ*quantityOr) as MatItog from composition join (product join orderspec on product.IDproduct=orderspec.IDproduct) on
composition.IDproduct=product.IDproduct where orderspec.IDorder=21 group by Idmat) as q1 left join
(select material.Idmat, (IF(SUM(QuantitySup) IS NULL, 0, SUM(QuantitySup)) - IF(SUM(quantityRel) IS NULL, 0, SUM(quantityRel))) as itog
from supplyspec right join (material left join releasespec on material.Idmat=releasespec.Idmat) on supplyspec.Idmat=material.Idmat group by material.Idmat) as q2
on q1.Idmat=q2.Idmat;