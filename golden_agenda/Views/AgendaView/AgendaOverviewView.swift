//
//  AgendaOverviewView.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-17.
//

import SwiftUI

struct AgendaOverviewView: View {
    @EnvironmentObject private var gaRouter: GARouter

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
                
                EmptyAgenda()
                    .padding(.horizontal, 12)
            }
        }
    }
    
    @ViewBuilder
    func twoColumn() -> some View {
        HStack(spacing: 12, content: {
            VStack(
                alignment: .leading,
                content: {
                    Text("Point flow")
                        .gaTypography(.footnote2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Button(action: { print("testing") }, label: { Text("yayaya") })
                }
            )
            .modifier(addSquareBorderModifier())
                
            VStack(
                alignment: .leading,
                content: {
                    Text("Rewards")
                        .gaTypography(.footnote2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .modifier(addSquareBorderModifier())
            
        })
    }
    
    @ViewBuilder
    func EmptyAgenda() -> some View {
        VStack {
            Text("Nothing to show")
                .gaTypography(.footnote2)
                .fontWeight(.regular)
                .foregroundColor(.grey2)
                .padding(.top, 12)
            
            createGAShape(.checkboxMarkedCirclePlusOutline)
                .frame(width: 36, height: 36)
                .padding(.vertical, 8)
                .foregroundColor(.yellow1)
            
            Button(
                action: {
                    withAnimation {
                        gaRouter.pushTo(.addAgenda)
                    }
                }, label: {
                    Text("Add a new agenda")
                        .gaTypography(.body1)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .foregroundColor(.yellow1)
                                .shadow(color: .black1.opacity(0.2), radius: 8, y: 2)
                        )
                }
            )
            .padding(.bottom, 12)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
        .background(GABorderView())
    }
}

private struct addSquareBorderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 8)
            .padding(.bottom, 10)
            .padding(.top, 12)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .aspectRatio(1.0, contentMode: .fill)
            .background(GABorderView())
    }
}

#Preview {
    AgendaOverviewView().globalPreviewInjection()
}
