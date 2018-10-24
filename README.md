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

```
As a user,
So that I can remove bookmarks I no longer need,
I would like to be able to delete bookmarks
```

```
As a user,
So that I can keep my list up to date,
I would like to be able to update bookmarks
```

## Setting up the database

1. Connect to `psql`
2. Create the database by typing `CREATE DATABASE bookmark_manager;` into the REPL
3. Connect to the database by typing `\c bookmark_manager`
4. Run the queries saved in `db/migrations`

## Setting up the test database

Follow the same steps, but name the database bookmark_manager_test in step 2.
