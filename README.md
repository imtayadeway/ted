ted
===

a ruby .ods parser and writer

this is a currently non-functioning parser and writer for OpenDocument Spreadsheet files written in Ruby, in active development.

it is being made partly in response to the lack of:

1. features
2. a clean, simple and intuitive interface that hides the details of having to specify every goddamn cell you want to manipulate
3. a straightforward license

in many other spreadsheet generators. the initial aim is to be able to create a complete spreadsheet from a dataset that conforms to a certain structure (typically an array of hashes) in a few steps, in a way that I would want to create a spreadsheet 99% of the time. ideally it should look something like this:

```ruby
book = Ted::Book.build(filename: 'sample')
sheet = book.add_sheet(
  name: 'sheet 1',
  a: {id: :name, name: 'Name'},
  b: {id: :date, name: 'Date', format: :date},
  c: {id: :charge, name: 'Charges', format: :currency}
  d: {id: :percent, name: 'The Percentages', format: percent}
)

# lots of dataset-generating code omitted

dataset.each { |row| sheet.insert(row) }

book.save
```

and you've got your sample.ods file.
