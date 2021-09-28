
  final createTable = '''
  CREATE TABLE despesa(
     id INT PRIMARY KEY 
    ,nome VARCHAR(200) NOT NULL
    ,tipo VARCHAR(16) NOT NULL
    ,valor VARCHAR NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
  )
''';

final insert1 = '''
INSERT INTO despesa (nome, tipo, valor, url_avatar)
VALUES
('Mercado XY', 'alimentação', '123.30', 'https://cdn.pixabay.com/photo/2015/05/13/07/46/burger-765125__480.jpg')
''';


final insert2 = '''
INSERT INTO despesa (nome, tipo, valor, url_avatar)
VALUES 
 ('Ifood', 'alimentação', '20.40', 'https://cdn.pixabay.com/photo/2015/05/13/07/46/burger-765125__480.jpg')

''';


final insert3 = '''
INSERT INTO despesa (nome, tipo, valor, url_avatar)
VALUES ('Internet', 'residência', '100.00', 'https://cdn.pixabay.com/photo/2014/04/03/00/38/house-308936__340.png')
''';

