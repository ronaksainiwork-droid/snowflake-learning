-- Snowflake Basics
-- Topics:
-- Create Database
-- Create Schema
-- Create Table
-- Insert Data
-- Select Query
-- Describe Table

CREATE DATABASE regexdb;

USE regexdb;

CREATE SCHEMA IF NOT EXISTS regexdb.table_schema;

CREATE TABLE test1(
    id INT,
    name VARCHAR(20)
);

INSERT INTO test1
VALUES
(10,'aman'),
(11,'yash');

SELECT * FROM test1;

DESC TABLE test1;
create database regexdb;

-- schema inside the databasse
-- subcontainer in the database
-- to manager everything like my table , view , permission on this

use regexdb;


select current_database();


create schema  if not exists regexdb.table_schema;

create table test1(id int , name varchar(20));

insert into test1 values(10,'aman'),(11 , 'yash');

select * from test1;
desc table test1;

describe table test1; 