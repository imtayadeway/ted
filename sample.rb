book = Ted::Book.build(filename: 'sample')
sheet = book.build(
  name: 'sheet 1',
     a: {id: :data_1, name: 'a header'},
     b: {id: :data_2, name: 'another header', format: :date},
     c: {id: :data_3, name: 'yet another header', format: :currency}
 )

# do some manipulation:
sheet.name = 'new name'
sheet.headers << {id: data_4, name: 'a late header' }
sheet.headers.insert(:b, {id: data_4, name: 'an inserted header'})

# some spectacular data-generating code....

data.each { |d| sheet.insert(d) }

book.save
