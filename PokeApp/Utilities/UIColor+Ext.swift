//
//  UIColor+Ext.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 28/01/2021.
//

import UIKit

extension UIColor {
    
    static var secondaryGreen: UIColor {
        return UIColor(named: "secondaryGreen")!
    }
    
    static var grassTypePrimary: UIColor {
        return UIColor(named: "grassTypePrimary")!
    }
    
    static var grassTypeSecondary: UIColor {
        return UIColor(named: "grassTypeSecondary")!
    }
    
    static var waterTypePrimary: UIColor {
        return UIColor(named: "waterTypePrimary")!
    }
    
    static var waterTypeSecondary: UIColor {
        return UIColor(named: "waterTypeSecondary")!
    }
    
    static var fireTypePrimary: UIColor {
        return UIColor(named: "fireTypePrimary")!
    }
    
    static var fireTypeSecondary: UIColor {
        return UIColor(named: "fireTypeSecondary")!
    }
    
    static var bugTypePrimary: UIColor {
        return UIColor(named: "bugTypePrimary")!
    }
    
    static var bugTypeSecondary: UIColor {
        return UIColor(named: "bugTypeSecondary")!
    }
    
    static var darkTypePrimary: UIColor {
        return UIColor(named: "darkTypePrimary")!
    }
    
    static var darkTypeSecondary: UIColor {
        return UIColor(named: "darkTypeSecondary")!
    }
    
    static var dragonTypePrimary: UIColor {
        return UIColor(named: "dragonTypePrimary")!
    }
    
    static var dragonTypeSecondary: UIColor {
        return UIColor(named: "dragonTypeSecondary")!
    }
    
    static var electricTypePrimary: UIColor {
        return UIColor(named: "electricTypePrimary")!
    }
    
    static var electricTypeSecondary: UIColor {
        return UIColor(named: "electricTypeSecondary")!
    }
    
    static var fairyTypePrimary: UIColor {
        return UIColor(named: "fairyTypePrimary")!
    }
    
    static var fairyTypeSecondary: UIColor {
        return UIColor(named: "fairyTypeSecondary")!
    }
    
    static var fightingTypePrimary: UIColor {
        return UIColor(named: "fightingTypePrimary")!
    }
    
    static var fightingTypeSecondary: UIColor {
        return UIColor(named: "fightingTypeSecondary")!
    }
    
    static var flyingTypePrimary: UIColor {
        return UIColor(named: "flyingTypePrimary")!
    }
    
    static var flyingTypeSecondary: UIColor {
        return UIColor(named: "flyingTypeSecondary")!
    }
    
    static var ghostTypePrimary: UIColor {
        return UIColor(named: "ghostTypePrimary")!
    }
    
    static var ghostTypeSecondary: UIColor {
        return UIColor(named: "ghostTypeSecondary")!
    }
    
    static var groundTypePrimary: UIColor {
        return UIColor(named: "groundTypePrimary")!
    }
    
    static var groundTypeSecondary: UIColor {
        return UIColor(named: "groundTypeSecondary")!
    }
    
    static var iceTypePrimary: UIColor {
        return UIColor(named: "iceTypePrimary")!
    }
    
    static var iceTypeSecondary: UIColor {
        return UIColor(named: "iceTypeSecondary")!
    }
    
    static var normalTypePrimary: UIColor {
        return UIColor(named: "normalTypePrimary")!
    }
    
    static var normalTypeSecondary: UIColor {
        return UIColor(named: "normalTypeSecondary")!
    }
    
    static var poisonTypePrimary: UIColor {
        return UIColor(named: "poisonTypePrimary")!
    }
    
    static var poisonTypeSecondary: UIColor {
        return UIColor(named: "poisonTypeSecondary")!
    }
    
    static var psychicTypePrimary: UIColor {
        return UIColor(named: "psychicTypePrimary")!
    }
    
    static var psychicTypeSecondary: UIColor {
        return UIColor(named: "psychicTypeSecondary")!
    }
    
    static var rockTypePrimary: UIColor {
        return UIColor(named: "rockTypePrimary")!
    }
    
    static var rockTypeSecondary: UIColor {
        return UIColor(named: "rockTypeSecondary")!
    }
    
    static var steelTypePrimary: UIColor {
        return UIColor(named: "steelTypePrimary")!
    }
    
    static var steelTypeSecondary: UIColor {
        return UIColor(named: "steelTypeSecondary")!
    }
    
    static var unknownTypePrimary: UIColor {
        return UIColor(named: "groundTypePrimary")!
    }
    
    static var unknownTypeSecondary: UIColor {
        return UIColor(named: "unknownTypeSecondary")!
    }
    
    static func getBackgroundColor(by ability: String) -> (UIColor, UIColor) {
        switch ability.lowercased() {
        case AbilityType.fire.rawValue:
            return (fireTypePrimary, fireTypeSecondary)
        case AbilityType.grass.rawValue:
            return (grassTypePrimary, grassTypeSecondary)
        case AbilityType.water.rawValue:
            return (waterTypePrimary, waterTypeSecondary)
        case AbilityType.bug.rawValue:
            return (bugTypePrimary, bugTypeSecondary)
        case AbilityType.dark.rawValue:
            return (darkTypePrimary, darkTypeSecondary)
        case AbilityType.dragon.rawValue:
            return (dragonTypePrimary, dragonTypeSecondary)
        case AbilityType.electric.rawValue:
            return (electricTypePrimary, electricTypeSecondary)
        case AbilityType.fairy.rawValue:
            return (fairyTypePrimary, fairyTypeSecondary)
        case AbilityType.fighting.rawValue:
            return (fightingTypePrimary, fightingTypeSecondary)
        case AbilityType.flying.rawValue:
            return (flyingTypePrimary, flyingTypeSecondary)
        case AbilityType.ghost.rawValue:
            return (ghostTypePrimary, ghostTypeSecondary)
        case AbilityType.ground.rawValue:
            return (groundTypePrimary, groundTypeSecondary)
        case AbilityType.ice.rawValue:
            return (iceTypePrimary, iceTypeSecondary)
        case AbilityType.normal.rawValue:
            return (normalTypePrimary, normalTypeSecondary)
        case AbilityType.poison.rawValue:
            return (poisonTypePrimary, poisonTypeSecondary)
        case AbilityType.psychic.rawValue:
            return (psychicTypePrimary, psychicTypeSecondary)
        case AbilityType.rock.rawValue:
            return (rockTypePrimary, rockTypeSecondary)
        case AbilityType.steel.rawValue:
            return (steelTypePrimary, steelTypeSecondary)
        default:
            return (unknownTypePrimary, unknownTypeSecondary)
        }
    }
    
}

enum AbilityType: String {
    case fire
    case grass
    case water
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case flying
    case ghost
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
}
