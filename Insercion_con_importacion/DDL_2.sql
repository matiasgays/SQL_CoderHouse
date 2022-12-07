drop table if exists pedidos;
create table pedidos as ( select
	id,
	cast(cliente as char(50)) as cliente,
    cast(codigo as char(25)) as codigo,
    cast(cantidad as unsigned) as cantidad,
    date_format(str_to_date(fecha_ingreso,'%d/%m/%Y'),'%d/%m/%Y') as fecha_ingreso,
    date_format(str_to_date(fecha_objetivo,'%d/%m/%Y'),'%d/%m/%Y') as fecha_objetivo
	from stg_pedidos
);

SET FOREIGN_KEY_CHECKS=0;
alter table pedidos
add constraint fk_productos_pedidos 
foreign key (codigo)
references productos(codigo);

alter table pedidos
add constraint fk_clientes_pedidos  
foreign key (cliente)
references clientes(razon_social);

SET FOREIGN_KEY_CHECKS=1;