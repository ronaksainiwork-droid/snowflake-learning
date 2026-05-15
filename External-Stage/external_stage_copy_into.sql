-- External Stage and COPY INTO Practice
-- Topics:
-- Create Database
-- Create Schema
-- Create Table
-- AWS S3 Bucket Usage
-- External Stage Creation
-- AWS S3 Connection
-- Stage Description
-- LIST Command
-- COPY INTO
-- CSV File Loading
-- Separate Schema for Stages
-- Separate Schema for Tables 

--***********External stage ******************



create or replace database regex2_db;

-- create schema 
--this schema use for only stages (connection) ka data store karne k liye bnaya h ai 
create or replace schema  regex2_db.external_stages_s3; -- only stage store k liye ye schema bnaya hai



-- craeteing externa 
l stage
create or replace stage regex2_db.external_stages_s3.aws_ext_stage

url='s3://ronak-regex' -- bucket name (url)
credentials=(aws_key_id= 'xxxx'
aws_secret_key= 'xxxxxx');


-- describe of external stage

desc stage regex2_db.external_stages_s3.aws_ext_stage;

list @regex2_db.external_stages_s3.aws_ext_stage;




-- -- createing schema in snowflake (ware house) table

create schema if not exists regex2_db.reg_tables_schema; -- create schema for the tables


-- userid  movieid tag TIMESTAMP
create or replace table regex2_db.reg_tables_schema.tags_t(
userid int,
movieid int,
tag string,
`timestamp` int);

describe table tags_t;
select * from tags_t;

list @regex2_db.external_stages_s3.aws_ext_stage;


-- copy data into stage
copy into regex2_db.reg_tables_schema.tags_t
from @regex2_db.external_stages_s3.aws_ext_stage 
file_format = (skip_header = 1) ; 



