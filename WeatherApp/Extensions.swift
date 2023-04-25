import Foundation
import SwiftUI

// Extensión para Dobles redondeados a 0 decimales
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}


// Extensión para agregar esquinas redondeadas a esquinas específicas
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Forma de esquina redondeada personalizada utilizada para la extensión de radio de esquina anterior
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

