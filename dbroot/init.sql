DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS links_categories;

create table links_categories
(
    id      serial           not null
        constraint links_categories_pk
            primary key,
    name    varchar(64)      not null,
    chat_id bigint default 0 not null
);

alter table links_categories
    owner to links_keeper_user;

INSERT INTO public.links_categories (id, name, chat_id) VALUES (5, 'Общее', 247021014);

create table links
(
    id          serial           not null
        constraint links_pk
            primary key,
    url         varchar(2048)    not null,
    description varchar(1024)    not null,
    category_id integer          not null
        constraint links_links_categories_id_fk
            references links_categories
            on update restrict on delete restrict,
    chat_id     bigint default 0 not null
);

alter table links
    owner to links_keeper_user;

INSERT INTO public.links (id, url, description, category_id, chat_id) VALUES (30, 'https://newlink.ru', 'супер пупер описание', 5, 247021014);