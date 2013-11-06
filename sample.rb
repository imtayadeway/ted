book = Ted::Book.build(filename: 'sample')
sheet = book.add_sheet(
  name: 'sheet 1',
     a: {id: :data_1, name: 'a header'},
     b: {id: :data_2, name: 'another header', format: :date},
     c: {id: :data_3, name: 'yet another header', format: :currency}
 )

# do some manipulation:
sheet.name = 'new name'
sheet.headers << {id: data_4, name: 'a late header' }
sheet.headers.insert(:b, {id: data_4, name: 'an inserted header'})

# lots of spectacular data-generating code

dataset.each { |row| sheet.insert(row) }

book.save
