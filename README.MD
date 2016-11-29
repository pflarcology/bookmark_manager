User Stories

As a user
So that I can keep track of my bookmarks
I want to see a list of my links

As a user
so that I can store my links
I would like to add new links to the list

As a user
So that I can keep track of my links
I want to be able to tag my links

As a user
so that I can keep track of my links
I want to be able to filter my links by tag


Short blog post:
  CRUD
    CRUD stands for create, read, update and delete. These comprise the ways that a database can be interacted with. These make up the four functions of persistence storage. Persistence is a characteristic of a state that outlives the process that created it. This is unlike most computer programs that reset after they stop being used. Programs interact with databases by transferring data to and from them.

    Create is about adding new entries.
    Read is accessing the entries.
    Update regards modifying existing entries.
    Delete is when entries are destroyed.

  SQL
    SQL stands for structured query language. It is a programming language designed for managing information held in a relational database management system (RDBMS).

  SQL Examples

    These are example for an existing database called students. That has a ID column and a varchar column called name.

    C - INSERT INTO students (name)
          VALUES ('Rorjack');
    R - SELECT * FROM students;
    U - UPDATE students SET name = 'Jackory' WHERE name = 'Rojack';
    D - DELETE FROM students WHERE name = 'Jackory';
