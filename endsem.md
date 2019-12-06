# TA Remarks on Endsem

## On Batch Performance

## Read Before Asking Doubts

* I'm not penalizing you for brackets or lack thereof, so don't ask. In cases that I test your program by running it, I use all the syntactic correction offered by DrRacket to try to get a syntactically correct version of your written code. (In cases this has resulted in me doing something like a human min-edit distance algorithm. Now you know why your corrections took so long.)
* For some students, I've written something along the lines of "explain" for specific questions. This means that your code either does not produce correct results or does not compile, and I can only give you partial marks if you explain the logic your code was supposed to execute.
* My marking on question 4- the essay-type question- is final. Please ask about it only if I have forgotten to mark you for a question or section of your answer.

## Potential T.A Errors

### 2.4

For `take`, if you have implemented a tail-recursive definition like so:

```
(define stake
  (lambda (n stream)
    (if (zero? n) '()
        (cons (hd stream) (stake (- n 1) (tl stream))))))
```

and I have cut marks, let me know. You should get full for this question.

### 5.1: reduce -> reduce/k

Is out of 20 marks. If I haven't marked any errors but still given you 10, let me know.


## 1.a.

I'm not counting `-` as a keyword or an identifier, because, c'mon. If you either mark it or don't, it will not matter to your score.

## 1.b.

`sub1` is not a racket keyword, but I'm ignoring it during correction because, well, it's neither a readily evident keyword nor an evidently not-keyword. (Making allowance for the fact that your practical work in this course has been in Haskell, not Racket)

## 2 

In general, a very large section saw "streams" and thought "infinite lists". Which is a pretty understandable mistake, but a mistake nonetheless.

## 2.1

In Racket, this expression will throw an error, not be evaluated. You might be thinking of Haskell, where `ls = 1 : ls` will indeed throw an infinite loop when `ls` is evaluated. 

I have not cut marks for this confusion because I don't expect you all to know the error mechanisms of Racket vs. those of Haskell. The general awareness of "this expression won't run because recursion with no base case" is enough.

# 2.3

In this and the previous question, a lot of people makes the mistake of treating a _stream_ as a _list_. Think of what will happen if you call a recursing-over-lists function that has no base case for an infinite list!

## 3.1

Marked on if you've gotten the semantic domains correct and complete.

## 3.2

* It is possible to functionally program in C with absolutely no mutation, and treating the memory as a sort of extended environment. "But why would you do that." is a very good question.
* I'm very amused to see all of y'all recommending racket, given that I don't think any of you will touch Racket after this course.

## 3.3

I have given full marks if you have made points using any three out of the following:

- syntax
- semantic domains
- type systems
- evaluation style

## 5

7.5 : new-env that binds exception-id
7.5 : new-env that binds value-id
7.5 : new continuation that evaluates the `except` block
7.5 : new continuation that evaluates the `finally` block
5   : calling eval-ast/k with the new continuations and environment
5   : putting everything syntactically together in a way that actually works (excepting minor errors like brackets, keyword mistakes, etc) 

