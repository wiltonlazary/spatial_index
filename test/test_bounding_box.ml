open Core.Std
open OUnit
open Spatial_index.Bounding_box

let test =
  "Bounding_box" >::: [

    "bb1 overlaps bb2" >:: (fun () ->
             let bb1 = ((0.0, 0.0), (500.0, 500.0)) in
             let bb2 = ((10.0, 10.0), (20.0, 20.0)) in
             assert_equal true (overlaps bb1 bb2));

    "bb1 exactly overlaps bb2" >:: (fun () ->
             let bb1 = ((0.0, 0.0), (100.0, 100.0)) in
             let bb2 = ((0.0, 0.0), (100.0, 100.0)) in
             assert_equal true (overlaps bb1 bb2));

    "bb1 doesn't overlap bb2 1" >:: (fun () ->
             let bb1 = ((1.0, 1.0), (100.0, 100.0)) in
             let bb2 = ((0.0, 0.0), (100.0, 100.0)) in
             assert_equal false (overlaps bb1 bb2));

    "bb1 doesn't overlap bb2 2" >:: (fun () ->
             let bb1 = ((10.0, 0.0), (100.0, 100.0)) in
             let bb2 = ((110.0, 0.0), (200.0, 100.0)) in
             assert_equal false (overlaps bb1 bb2));

    "bb1 doesn't overlap bb2 3" >:: (fun () ->
             let bb1 = ((-10.0, 0.0), (-100.0, 100.0)) in
             let bb2 = ((110.0, 0.0), (200.0, 100.0)) in
             assert_equal false (overlaps bb1 bb2));

    "area" >:: (fun () ->
                let bb = ((0., 0.), (10., 10.)) in
                assert_equal 100. (area bb));

    "union" >:: (fun () ->
                let bb1 = ((9., 0.), (10., 10.)) in
                let bb2 = ((-1., -10.), (0., 0.)) in
                let bb = ((-1., -10.), (10., 10.)) in
                assert_equal bb (union bb1 bb2));

    "union_many" >:: (fun () ->
                let bb1 = ((9., 0.), (10., 10.)) in
                let bb2 = ((-1., -10.), (0., 0.)) in
                let bb3 = ((-10., -10.), (0., 0.)) in
                let bb = ((-10., -10.), (10., 10.)) in
                assert_equal bb (union_many [bb1; bb2; bb3]));

  ];;
