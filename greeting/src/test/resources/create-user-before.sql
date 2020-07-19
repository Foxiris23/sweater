delete
from user_role;
delete
from user;


insert into user(id, active, password, username)
values (1, true, '$2a$08$OcgkJOhq/a7q9u57fRuUFeVc/HGII9mCRgJUPrDm1RJYQuGY8SYvy', 'test'),
       (2, true, '$2a$08$OcgkJOhq/a7q9u57fRuUFeVc/HGII9mCRgJUPrDm1RJYQuGY8SYvy', 'test2');

insert into user_role(user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN'),
       (2, 'USER');