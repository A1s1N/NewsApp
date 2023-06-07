//
//  DetailView.swift
//  NewsApp
//
//  Created by Никита Александров on 07.06.2023.
//

import SwiftUI
import RealmSwift

struct DetailView: View {
    
    var title: String?
    var link: String?
    var content: String?
    var pubDate: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(content ?? "")
                    .font(.system(size: 20))
                    .padding()
                Text("Source: " + (link ?? "link"))
                    .font(.footnote)
                    .padding()
                Text("Created: " + (pubDate ?? "date"))
                    .font(.footnote)

            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
        title: "Aiming for Its Global Growth, JINS Appoints Paul Nixon, Former Creative Director at Apple Inc., as Global Chief Creative Officer",
        link: "https://www.itbiznews.com/news/articleView.html?idxno=101530",
        content: "TOKYO , June 7, 2023 /PRNewswire/ -- JINS HOLDINGS Inc. (hereinafter \"JINS\"), a Tokyo -based company running Japan's largest eyewear brand JINS by volume, announced on June 1, 2023 , that Paul Nixon , who served at Apple Inc. (hereinafter \"Apple\") in many lead creative roles for approximately 18 years, including Creative Director, has joined JINS as Global Chief Creative Officer, effective the same day. Logo: https://cdn.kyodonewsprwire.jp/prwfile/release/M107727/202306026112/_prw_PI1fl_VmQv5O12.png?_ga=2.134809208.864404997.1685320196-1851103714.1593650756 Nixon brings over 25 years of design, marketing, and branding experience, most recently as a creative leader, at Apple based in Cupertino in the U.S. state of California . JINS is confident that Nixon's expertise and experience will be a major driving force in realizing JINS' innovative products, new customer experiences, and global growth going forward. Nixon launched the iPhone website in 2007 and the iPad website in 2010, where he was a lead interactive art director for the apple.com team reflecting Apple's core values of innovation and product and storytelling. He then served as Creative Director of apple.com for nearly seven years, leading the design team in creating hundreds of innovative product websites from concept to launch that featured amazing products from Apple. He has many years of experience leading in the marketing communications department, where he also helped evaluate and execute online store, retail, and social projects over the years. During his last three years at Apple, he helped define and design the many features and functions of the Apple Watch line of wearable products as a lead software designer on the product design team. During his nearly 18 years at Apple, Nixon saw Apple, under the leadership of Steve Jobs and now Tim Cook , grow from a $30 billion market cap to a $2.5 trillion market cap company when he left in November 2022 . JINS is looking forward to Nixon's contribution of creating value at JINS by his know-how and experience, not just in realizing tremendous growth, but also in utilizing his experience from Apple working with great employees, leaders, and executives at one of the world's most innovative and outstanding technology companies. Comments from Paul Nixon Photo: https://cdn.kyodonewsprwire.jp/prwfile/release/M107727/202306026112/_prw_PI2fl_4s7V2Hzb.jpeg?_ga=2.104779529.864404997.1685320196-1851103714.1593650756 \"After visiting Maebashi in 2019, I had the opportunity to witness firsthand the creativity, innovation, and influence of Mr. Hitoshi Tanaka (founder and CEO of JINS), who is a driving force behind creating the best experiences in his hometown. I then had the chance to meet Mr. Tanaka by chance and learn more about the mission and story of JINS, and was immediately attracted not only to his amazing Maebashi projects, but also to JINS as a company with a vision and great products that can magnify people's lives. I am looking forward to being a part of JINS' global-scale mission, and I truly believe that JINS is a special company that can enrich the lives of its customers under the brand vision of \"Magnify Life\" around the world. In the coming years, I believe JINS can and will become the global standard for eyewear product design, innovation and value -- as well as providing standout customer experiences and services. I am so excited, humbled, and honored to be joining the JINS team. And also inspired to be working directly with Mr. Tanaka and the team to help introduce JINS globally.\" For the original release, please visit: https://kyodonewsprwire.jp/attach/202306026112-O1-c1ZuVA55.pdf",
        pubDate: "2023-06-07 08:43:04"
        )
    }
}
