# Bookmark Manager


## User Stories

```
As a user,
So that I can view the bookmarks I have added,
I would like the application to show a list of bookmarks
```

```
As a user,
So that I can keep a list of interesting webpages I encounter,
I would like to be able to add new bookmarks
```

## Setting up the database

1. Connect to `psql`
2. Create the database by typing `CREATE DATABASE bookmark_manager;` into the REPL
3. Connect to the database by typing `\c bookmark_manager`
4. Run the query saved in the file `db/migrations/01_create_bookmarks_table.sql`

## Setting up the test database

Follow the same steps, but name the database bookmark_manager_test.
