CREATE ROLE 'Admin';

GRANT ALL PRIVILEGES ON showroom.* TO 'Admin';

CREATE ROLE 'Empleada';

GRANT INSERT, SELECT ON showroom.Cliente TO 'Empleada';
GRANT INSERT, SELECT ON showroom.Compra TO 'Empleada';
GRANT INSERT, SELECT ON showroom.ProductoCompra TO 'Empleada';


CREATE USER 'admin_user'@'%' IDENTIFIED BY 'password_admin';
GRANT 'Admin' TO 'admin_user';

CREATE USER 'empleada_user'@'%' IDENTIFIED BY 'password_empleada';
GRANT 'Empleada' TO 'empleada_user';

FLUSH PRIVILEGES;