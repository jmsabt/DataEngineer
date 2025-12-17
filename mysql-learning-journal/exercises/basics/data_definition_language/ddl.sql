CREATE TABLE table_name (
	{column_name} {data type} {constraint}
	id INT NOT NULL
	
	CONSTRAINT pk_table_name PRIMARY KEY ({column_name})
	CONSTRAINT pk_persons PRIMARY KEY (id)
)


ALTER TABLE table_name
ALTER TABLE persons

ADD {column_name} {data type} {constraint}
ADD email VARCHAR(50) NOT NULL


ALTER TABLE persons
DROP COLUMN column_name;


DROP TABLE table_name