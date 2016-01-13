# FileDiff

FileDiff is a gem providing ability to compare multiple files. It doesn't have rails as a dependency, so can use it independently

## Usage

To install add the following line to `Gemfile`

```ruby
  gem 'file_diff'
```
or just run
```ruby
  gem install file_diff
```
Then you are able to compare files in your application to get diff as
* array:
```
  FileDiff.perform('/path/to/file', '/path/to/another/file', '/path/to/one/more/file')
```
* console output:
```
  FileDiff.perform_with_output('/path/to/file', '/path/to/another/file', '/path/to/one/more/file')
```
Alternatively you can execute a bin file just from your console:
```
file_diff /path/to/file /path/to/another/file /path/to/one/more/file
```
## Output
The first column shows line number regarding the first file.

The second column shows:
* * in case if line has changed
* – in case line exists in the first file but does not exist in the second one
* + in case line does not exist in the first file but exists in the second one
* Nothing if line has not changed.

The third column shows:
* If line has changed, it shows text in the following format: Line content from the first file | line content from the second file
* If line exists in the first file but is missing in the second file – show the line content
* If the line is added in the second file – show the line content
