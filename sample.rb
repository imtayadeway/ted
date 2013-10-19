book = Ted::Book.build(filename: 'sample')
sheet = book.sheets.create('sheet 1',
                           a: {id: :data_1, name: 'a header'},
                           b: {id: :data_2, name: 'another header'},
                           c: {id: :data_3, name: 'yet another header'})
sheet.name = new_sheet_name
sheet.headers = new_headers_array
sheet.headers << new_headers
sheet.headers.insert(:b, {id: data_4, name: 'inserted header'})

# some data-generating code

data.each { |d| sheet.insert(d) }

book.save
