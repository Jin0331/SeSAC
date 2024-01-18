//
//  Trend.swift
//  APIPractice
//
//  Created by JinwooLee on 1/18/24.
//

import Foundation

/*
 1.Trend-movew의 day와 week은 데이터 구조의 차이가 없음 ---> id는 movie_id
 2.Trend-persion도 마찬가지이고, 특정 배우나 감독에 대한 설명과 주요 작품에 대한 정보를 나타냄. ---> Movie에 비해 훨씬 복잡한 구조
 */

// Trend-movie --- week
/*
 {
     "page": 1,
     "results": [
         {
             "adult": false,
             "backdrop_path": "/f1AQhx6ZfGhPZFTVKgxG91PhEYc.jpg",
             "id": 753342,
             "title": "Napoleon",
             "original_language": "en",
             "original_title": "Napoleon",
             "overview": "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine.",
             "poster_path": "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
             "media_type": "movie",
             "genre_ids": [
                 36,
                 10752,
                 18
             ],
             "popularity": 2367.318,
             "release_date": "2023-11-22",
             "video": false,
             "vote_average": 6.498,
             "vote_count": 1212
         },
         {
             "adult": false,
             "backdrop_path": "/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg",
             "id": 609681,
             "title": "The Marvels",
             "original_language": "en",
             "original_title": "The Marvels",
             "overview": "Carol Danvers, aka Captain Marvel, has reclaimed her identity from the tyrannical Kree and taken revenge on the Supreme Intelligence. But unintended consequences see Carol shouldering the burden of a destabilized universe. When her duties send her to an anomalous wormhole linked to a Kree revolutionary, her powers become entangled with that of Jersey City super-fan Kamala Khan, aka Ms. Marvel, and Carol’s estranged niece, now S.A.B.E.R. astronaut Captain Monica Rambeau. Together, this unlikely trio must team up and learn to work in concert to save the universe.",
             "poster_path": "/Ag3D9qXjhJ2FUkrlJ0Cv1pgxqYQ.jpg",
             "media_type": "movie",
             "genre_ids": [
                 878,
                 12,
                 28
             ],
             "popularity": 569.145,
             "release_date": "2023-11-08",
             "video": false,
             "vote_average": 6.371,
             "vote_count": 893
         }
 }
 */
 
// Trend-person --- week
/*
 {
     "page": 1,
     "results": [
         {
             "adult": false,
             "id": 525,
             "name": "Christopher Nolan",
             "original_name": "Christopher Nolan",
             "media_type": "person",
             "popularity": 47.499,
             "gender": 2,
             "known_for_department": "Directing",
             "profile_path": "/xuAIuYSmsUzKlUMBFGVZaWsY3DZ.jpg",
             "known_for": [
                 {
                     "adult": false,
                     "backdrop_path": "/8ZTVqvKDQ8emSGUEMjsS4yHAwrp.jpg",
                     "id": 27205,
                     "title": "Inception",
                     "original_language": "en",
                     "original_title": "Inception",
                     "overview": "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
                     "poster_path": "/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg",
                     "media_type": "movie",
                     "genre_ids": [
                         28,
                         878,
                         12
                     ],
                     "popularity": 102.496,
                     "release_date": "2010-07-15",
                     "video": false,
                     "vote_average": 8.367,
                     "vote_count": 35075
                 },
                 {
                     "adult": false,
                     "backdrop_path": "/xJHokMbljvjADYdit5fK5VQsXEG.jpg",
                     "id": 157336,
                     "title": "Interstellar",
                     "original_language": "en",
                     "original_title": "Interstellar",
                     "overview": "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.",
                     "poster_path": "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
                     "media_type": "movie",
                     "genre_ids": [
                         12,
                         18,
                         878
                     ],
                     "popularity": 164.391,
                     "release_date": "2014-11-05",
                     "video": false,
                     "vote_average": 8.426,
                     "vote_count": 33389
                 },
                 {
                     "adult": false,
                     "backdrop_path": "/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg",
                     "id": 155,
                     "title": "The Dark Knight",
                     "original_language": "en",
                     "original_title": "The Dark Knight",
                     "overview": "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
                     "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
                     "media_type": "movie",
                     "genre_ids": [
                         18,
                         28,
                         80,
                         53
                     ],
                     "popularity": 105.171,
                     "release_date": "2008-07-16",
                     "video": false,
                     "vote_average": 8.514,
                     "vote_count": 31271
                 }
             ]
         }

*/
