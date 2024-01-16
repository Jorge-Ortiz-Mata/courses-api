//
//  ContentView.swift
//  courses-list
//
//  Created by Jorge on 12/01/24.


// "https://zappycode.com/api/courses?format=json"

import SwiftUI

struct CoursesListView: View {
    @State var courses: [Course] = []
    
    var body: some View {
        VStack {
            if courses.count > 0 {
                List (courses) { course in
                    CourseCardView(course: course)
                }
            } else {
                Text("No courses registered")
            }
        }
        .onAppear() { getCourses() }
    }
    
    func getCourses () {
        if let apiURL = URL(string: "https://zappycode.com/api/courses?format=json") {
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let apiData = data {
                    if let coursesAPI = try? JSONDecoder().decode([Course].self, from: apiData) {
                        courses = coursesAPI
                    }
                }
            }.resume()
        }
    }
}

#Preview {
    CoursesListView()
}
