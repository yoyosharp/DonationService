drop database if exists donation_platform;
create database donation_platform charset utf8mb4;
use donation_platform;

create table if not exists roles(
	id int auto_increment,
    name varchar(50),
    primary key(id)
);

create table if not exists locations(
	id int auto_increment,
    name varchar(50),
    primary key(id)
);

create table if not exists users(
	id int auto_increment,
    user_name varchar(255),
    full_name varchar(255),
    email varchar(255),
    password varchar(60),
    phone varchar(50),
    location_id int,
    status tinyint,
    locked tinyint,
    create_at bigint,
    description text,
    primary key(id),
    foreign key(location_id) references locations(id)
);

create table if not exists authorities(
	id int auto_increment,
    user_id int,
    role_id int,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(role_id) references roles(id)
);

create table if not exists organizations(
	id int auto_increment,
    user_id int,
    primary key(id),
    foreign key(user_id) references users(id)
);

create table if not exists categories(
	id int auto_increment,
    name varchar(255),
    primary key(id)
);

create table if not exists donations(
	id int auto_increment,
    code varchar(50),
    name varchar(255),
    category_id int,
    organization_id int,
    location_id int,
    target bigint,
    fund bigint default 0,
    create_date bigint,
    start_date bigint,
    end_date bigint,
    description text,
    status tinyint,
    primary key(id),
    foreign key(category_id) references categories(id),
    foreign key(organization_id) references organizations(id),
    foreign key(location_id) references locations(id)
);

create table if not exists user_donations(
	id bigint auto_increment,
    donator_name varchar(255),
    message text,
    time bigint,
    amount bigint,
    status tinyint,
	user_id int,
    donation_id int,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(donation_id) references donations(id)
);