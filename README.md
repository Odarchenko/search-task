Ruby on Rails Developer test
To understand your coding ability and style, we have devised a simple
practical coding test. We use this as a discussion topic during interviews
and may use it as a sample of your knowledge when presenting to OnApp
management.

Objective: Make data provided with this task searchable
Minimum requirements:
- search logic should be implemented in pure ruby (without
frameworks)
- search match precision (full words matching)
- search for `Lisp Common` should match a programming language
named "Common Lisp"
- support for exact matches, e.g. `Interpreted "Thomas Eugene"`,
which should match "BASIC", but not "Haskell"
- match in different fields, e.g. `Scripting Microsoft` should return all
scripting languages designed by "Microsoft"
- solution elegance
- writing code with reusability and extensibility in mind.
Will be a plus:
- support for negative searches, e.g. john --array, which should match
"BASIC", "Haskell", "Lisp" and "S--Lang", but not "Chapel", "Fortran"
or "S".
Keep in mind:
- Comments are VERY useful, they help us understand your thought
process.
- This exercise is not meant to take more than a few hours.
- A readme file is encouraged.

### Run application
```sh 
$ bundle install
$ ruby one.rb
```
### Run tests

```sh 
$ rspec spec
```
