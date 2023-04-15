//
//  FlexibleLayout.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 15/4/23.
//

import UIKit

extension NSObject {
    func flexibleHeight(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * to / 926
    }
    func flexibleWidth(to: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * to / 428
    }
}
