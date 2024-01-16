//
//  CourseCardView.swift
//  courses-list
//
//  Created by Jorge on 15/01/24.
//

import SwiftUI

struct CourseCardView: View {
    var course: Course
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: course.image)) { response in
                    switch response {
                    case .success(let image):
                            image
                                .resizable()
                                .frame(height: 200)
                        default:
                            ProgressView()
                    }
                }
            }
            HStack {
                Text(course.title)
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.bottom, 5)
//            HStack {
//                Text(course.subtitle)
//                Spacer()
//            }
            
        }
    }
}

#Preview {
    CourseCardView(
        course: Course(
            id: 1,
            image: "https://zappycode.com/media/course_images/MasteringDjangoPart1CourseImage.png",
            title: "SwiftUI Course",
            subtitle: "The complete SwiftUI course for beginners"
        )
    )
}
