//
//  InterfaceController.swift
//  MyCookApp WatchKit Extension
//
//  Created by Efremov on 04.04.2022.
//

import WatchKit
import Foundation

struct Model {
    var Name: String
    var Emoji: String
    var Recipe: String
    var Image: String


    static func getData() -> [Model] {
        return [
            Model(Name: "Борщик", Emoji: "🍜", Recipe: "Говядина на косточке - 500г., Капуста- 400г, 3-4 картофелины, 1 морковь, 1 больша луковица, 3-4 зуба чеснока, 2 вкусных сладких свеклы. Можно предварительно попробовать. Безвкусная свекла будет просто бесполезна, 2-3 ст.л. томатной пасты. Можно использовать и нормальные, свежие помидоры или помидоры в собственном соку. Я пользуюсь обычно именно ими, 2.ч.л соли.", Image: "borsch"),
            Model(Name: "Цезарь", Emoji: "🥗", Recipe: "Грудка куриная - 1 шт. (400 г), Капуста пекинская - 1 шт., Помидоры черри - 150-200 г, Сыр твердый (желательно пармезан) - 50-70 г, Хлеб белый - 3-4 ломтика, Соль - по вкусу, Масло оливковое - 6 ст.л. (для жарки), Перец черный молотый - 1 ч.л., Чеснок - 4 зубчика, Майонез - 3-4 ст.л.", Image: "cesar"),
            Model(Name: "Блинчики", Emoji: "🥞", Recipe: "Яйцо – 1 шт., Мука – 150 г., Молоко –150 мл., Подсолнечное масло – 15 мл., Соль (по вкусу) – 20 г., Сахар (по вкусу) – 20 г.", Image: "blinchik"),
            Model(Name: "Мол. Коктейль", Emoji: "", Recipe: "Банан 2, Молоко или кокосовое молоко 350 мл., Какао 2 ст. ложки, Мед 1 ст. ложка, Кокосовая стружка для присыпки", Image: "milkshake"),
            Model(Name: "Спагетти", Emoji: "🍝", Recipe: "Спагетти (или другие макаронные изделия) - 250 г, Куриные бедра - 2 шт., Помидоры измельченные или томатный сок - 200 мл, Чеснок - 1 зубчик, Лук репчатый - 1 шт., Сыр твёрдый - 30 г, Масло растительное - 2-3 ст. ложки, Сахар (по желанию) - 1 ч. ложка, Соль - по вкусу, Перец свежемолотый - по вкусу, Базилик сушеный - по вкусу, Специи (на выбор) - по вкусу, Зелень свежая (для подачи) - 1 веточка", Image: "spagetti") ]
    }
}
class InterfaceController: WKInterfaceController {
    

    @IBOutlet weak var Table: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        Table.setNumberOfRows(Model.getData().count, withRowType: "tableId")
        
        for (index, item) in Model.getData().enumerated() {
            let controller = Table.rowController(at: index) as! TableRow
            controller.recipeIconLabel.setText(item.Emoji)
            controller.recipeNameLabel.setText(item.Name)
        }
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowindex: Int) -> Any? {
        return Model.getData() [rowindex]
    }
}
