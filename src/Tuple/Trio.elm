module Tuple.Trio exposing
    ( intrine
    , first, second, third
    , mapFirst, mapSecond, mapThird, mapAll
    )

{-| Elm has built-in syntax for tuples, so you can define 3D points like this:

    origin : ( Float, Float, Float )
    origin =
        ( 0, 0, 0 )

    position : ( Float, Float, Float )
    position =
        ( 3, 4, 5 )

This module is a bunch of helpers for working with 3-tuples.

**Note 1:** For more complex data, it is best to switch to records. So instead
of representing a 3D point as `(3,4,5)` and not having any helper functions,
represent it as `{ x = 3, y = 4, z = 5 }` and use all the built-in record
syntax!

**Note 2:** If your record contains a bunch of `Bool` and `Maybe` values,
you may want to upgrade to union types. Check out [Joël’s post][ut] for more
info on this. (Picking appropriate data structures is super important in Elm!)

**Note 3:** This text and most of the following documentation is shamelessly
replicated from the 2-tuple module of the core library and meticulously mangled
to fit a 3-tuple.

[ut]: https://robots.thoughtbot.com/modeling-with-union-types


# Create

@docs intrine


# Access

@docs first, second, third


# Map

@docs mapFirst, mapSecond, mapThird, mapAll

-}

-- CREATE


{-| Create a 3-tuple.

    -- intrine 3 4 5 == (3, 4, 5)
    zip3 : List a -> List b -> List c -> List ( a, b, c )
    zip3 xs ys zs =
        List.map3 Tuple.Trio.intrine xs ys zs

**Note:** I know the word _intrine_ is obscure and ancient, but it is a perfect fit
for this purpose. And there is a seedling of [a movement to bring it back][intrine].
[intrine]: <https://english.stackexchange.com/questions/559409/is-there-a-verb-counterpart-to-pair-when-bringing-together-three-things/559416#comment1381195_559416>

-}
intrine : a -> b -> c -> ( a, b, c )
intrine a b c =
    ( a, b, c )



-- ACCESS


{-| Extract the first value from a 3-tuple.

    first ( 3, 4, 5 ) == 3

    first ( "john", "doe", "jr." ) == "john"

-}
first : ( a, b, c ) -> a
first ( x, _, _ ) =
    x


{-| Extract the second value from a 3-tuple.

    second ( 3, 4, 5 ) == 4

    second ( "john", "doe", "jr." ) == "doe"

-}
second : ( a, b, c ) -> b
second ( _, y, _ ) =
    y


{-| Extract the third value from a 3-tuple.

    third ( 3, 4, 5 ) == 5

    third ( "john", "doe", "jr." ) == "jr."

-}
third : ( a, b, c ) -> c
third ( _, _, z ) =
    z



-- MAP


{-| Transform the first value in a 3-tuple.

    import String
    mapFirst String.reverse ("stressed", 16, True) == ("desserts", 16, True)
    mapFirst String.length  ("stressed", 16, True) == (8, 16, True)

-}
mapFirst : (a -> x) -> ( a, b, c ) -> ( x, b, c )
mapFirst func ( x, y, z ) =
    ( func x, y, z )


{-| Transform the second value in a 3-tuple.

    mapSecond sqrt ( "stressed", 16, True ) == ( "stressed", 4, True )

    mapSecond negate ( "stressed", 16, True ) == ( "stressed", -16, True )

-}
mapSecond : (b -> y) -> ( a, b, c ) -> ( a, y, c )
mapSecond func ( x, y, z ) =
    ( x, func y, z )


{-| Transform the third value in a 3-tuple.

    mapThird not ( "stressed", 16, True ) == ( "stressed", 16, False )

-}
mapThird : (c -> z) -> ( a, b, c ) -> ( a, b, z )
mapThird func ( x, y, z ) =
    ( x, y, func z )


{-| Transform all parts of a 3-tuple.

    import String
    mapAll String.reverse sqrt not ("stressed", 16, True) == ("desserts", 4, False)

-}
mapAll : (a -> x) -> (b -> y) -> (c -> z) -> ( a, b, c ) -> ( x, y, z )
mapAll funcA funcB funcC ( x, y, z ) =
    ( funcA x, funcB y, funcC z )
