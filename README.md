DataFrame
===============

This Ruby gem allows easy manipulation of matrix-like data using a syntax
stylistically similar to R's `data.frame`.

Examples
--------

Subsetting using vector indexing:

```ruby
some_data = 10.times.map { |x| Hash[a: rand, b: rand, c: rand] }
some_data = DataFrame[some_data]
some_data[some_data.a > 0.5, nil].nrow # 5
```

