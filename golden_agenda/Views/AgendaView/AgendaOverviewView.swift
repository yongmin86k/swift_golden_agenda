//
//  AgendaOverviewView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-17.
//

import SwiftUI

struct AgendaOverviewView: View {
    @State private var squareSize = CGFloat.zero

    var body: some View {
        ScrollView {
            VStack {
                twoColumn()
                    .padding(.horizontal, 12)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Agendas").gaTypography(.footnote2)
                    
                    Spacer()
                    
                    HStack(
                        spacing: 8, content: {
                            Text("0 / 0").gaTypography(.footnote2)
                            Text("0 / 0P")
                                .gaTypography(.footnote2)
                                .fontWeight(.regular)
                                .foregroundColor(.yellow1)
                        }
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
                
                GABorderView {
                    EmptyAgenda()
                }
                .padding(.horizontal, 12)
            }
        }
    }
    
    @ViewBuilder
    func twoColumn() -> some View {
        HStack(
            spacing: 12,
            content: {
                GABorderView {
                    VStack(
                        alignment: .leading,
                        content: {
                            Text("Point flow")
                                .gaTypography(.footnote2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    )
                    .padding(.horizontal, 8)
                    .padding(.bottom, 10)
                    .padding(.top, 12)
                    .frame(height: squareSize, alignment: .topLeading)
                }
                .readSize {
                    squareSize = $0.width
                }

                GABorderView {
                    VStack(
                        alignment: .leading,
                        content: {
                            Text("Rewards")
                                .gaTypography(.footnote2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    )
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                    .padding(.top, 12)
                    .frame(height: squareSize, alignment: .topLeading)
                }
            }
        )
    }
    
    @ViewBuilder
    func EmptyAgenda() -> some View {
        VStack {
            Text("Nothing to show")
                .gaTypography(.footnote2)
                .fontWeight(.regular)
                .foregroundColor(.grey2)
                .padding(.top, 12)
            
            createGAShape(type: .checkboxMarkedCirclePlusOutline)
                .frame(width: 36, height: 36)
                .padding(.vertical, 8)
                .foregroundColor(.yellow1)
            
            Button(
                action: {
                    print("hi")
                }, label: {
                    Text("Add a new agenda")
                        .gaTypography(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.yellow1)
                                .shadow(color: .black1.opacity(0.2), radius: 8, y: 2)
                        )
                }
            )
            .padding(.bottom, 12)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AgendaOverviewView()
}
