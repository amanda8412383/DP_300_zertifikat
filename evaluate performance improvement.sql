--index
--clusterd index only one per table usually primary key
--non clustered index can have as many as one wish, 
--but insert/update/delete rows will result in adjustment all existing index
--when creating index option 'with (fill factor = 62)
--this means it'll leave out 38% capacitý on index page for future insertion

--row store traditional way of store, a row is a set unit
--column store it store each column seperately
--it compress strings into number coding and a value table of the number coding

--DMV dynamic management views
--gather query performance info
