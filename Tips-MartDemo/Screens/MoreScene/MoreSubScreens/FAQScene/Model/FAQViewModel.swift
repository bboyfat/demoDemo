//
//  FAQViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/30/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class FAQViewModel{
    
    var tableView: UITableView?
    
    var questionsArray: [FAQCellModel] = [FAQCellModel(question: "Кэшбэк – что это?", description: "Кэшбэк буквально означает “деньги назад”. А если выражаться проще, то это «возврат части потраченных денег». ", example: "Например: сделав покупку, в магазине Rozetka, на сумму 5 000 грн вы можете получить 4% кэшбэка, то есть 200 грн возвращаются к вам после покупки." ), FAQCellModel(question: "Сервис Tips-Mart платный?", description: "Нет. Сервис Tips-Mart абсолютно бесплатный. Вы ни за что не платите, кроме самой покупки.", example: nil), FAQCellModel(question: "Как начисляется кэшбэк?", description: "Кэшбэк начисляется автоматически после покупки. Главное зарегистрироваться на кэшбэк-платформе Tips-Mart и перейти в нужный магазин.", example: nil), FAQCellModel(question: "Я забыл(а) перейти в магазин через сервис Tips-Mart. Кэшбэк не будет начислен?", description: "Да. Кэшбэк начисляется только, если вы перешли в магазин через сайт или приложение Tips-Mart.", example: "Но! Выход есть: вы можете уточнить у менеджера магазина, как можно отменить заказ. После этого повторно сделайте покупку, но уже через приложение Tips-Mart."), FAQCellModel(question: "Как я могу использовать накопившийся кэшбэк?", description: "Есть 3 простых способа: \n1. Вы можете вывести деньги на любую банковскую карту. \n2. Расплатиться в магазинах-партнера через платформу Tips-Mart. \n3. Пополнить баланс на мобильном телефоне", example: nil), FAQCellModel(question: "Я могу использовать сервис Tips-Mart только в интернет-магазинах?", description: "Нет, вы можете использовать сервис Tips-Mart как в онлайн, так и оффлайн магазинах и других партнерских точках", example: nil), FAQCellModel(question: "Начисляется ли кэшбэк, если покупать в рассрочку или наложенным платежом?", description: "Да, кэшбэк начисляется после того, как вы оформите покупку, вне зависимости от формы оплаты, а вывести его можно после получения товара.", example: nil), FAQCellModel(question: "Я тут передумал(а) покупать или изменил(а) условия покупки. Я получу кэшбэк?", description: "Нет. Кэшбэк будет отменен, если вы откажетесь от покупки или измените условия.", example: "Если вы хотите, что-то изменить в своем заказе – просто отмените предыдущий и сделайте новый заказ."), FAQCellModel(question: "Я не получил(а) кэшбэк после покупки! Что делать?", description: "Сначала выдохнуть – мы все решим! Теперь проверить, все ли вы сделали правильно в этой инструкции. Если вы убедились, что все тип-топ – напишите в нашу поддержку.", example: nil), FAQCellModel(question: "Я вижу этот ваш кэшбэк, но потратить/вывести его не могу!", description: "Магазины дают вам 14 дней на обмен или возврат товара. Поэтому вывести кэшбэк вы сможете по истечению этого срока и подтверждения от магазина.", example: nil), FAQCellModel(question: "Я хочу оформить заказ по телефону! Будет ли начислен кэшбэк?", description: "Нет:( Мы тоже за личное общение, но эти бездушные железные машины… Все таки нужно сделать заказ в интернете, чтобы кэшбэк был точно начислен.", example: "Но подтвердить заказ можно по телефону!"), FAQCellModel(question: "Какая минимальная сумма для вывода средств?", description: "Минимальная сумма вывода средств на банковскую карту от 100 грн Пополнить мобильный телефон - от 5 грн. Оплата в магазинах партнеров - от 1 грн", example: nil), FAQCellModel(question: "Если я воспользуюсь промокодом, будет ли начислен кэшбэк?", description: "Если вы получили промокод от кого-то или вы нашли его на просторах интернета – кэшбэк начислен не будет.", example: "Но! Вы можете использовать промокоды, которые пришли на ваш email от самого магазина, например: на день рождения, или купоны от продавцов на Aliexpress."), FAQCellModel(question: "Кэшбэк отклонен. Что делать? Куда бежать?", description: "Спокойно:) Причины по которым может быть отклонен кэшбэк: \n 1. Если вы отменяли / изменяли заказ или возвращали товар. \n 2. Если вы сделали покупку в кредит. \n 3. Если вы открыли спор на Aliexpress. \n 4. Если сервисы бронирования не подтвердили ваш заказ (проживание в отеле/ перелет и т.д.)", example: "Если с этим у вас все ок – напишите в нашу службу поддержки."), FAQCellModel(question: "Сколько времени ждать начисление кэшбэка?", description: "После покупки, в среднем, обработка и начисление кэшбэка занимают от 20 до 40 дней.", example: nil), FAQCellModel(question: "Нет моих любимых магазинов. Что делать?", description: ">Вы можете предложить добавить магазин, для этого воспользуйтесь этой формой", example: nil), FAQCellModel(question: "Как заработать больше? Что такое реферальная программа?", description: "Мы, конечно, не “МММ”, и это плюс, но можем предложить вам получать дополнительный кэшбэк. В личном кабинете вы сможете найти вашу личную реферальную ссылку. Если ваш друг перейдёт по этой ссылке, зарегистрируется, и сделает покупку – вы получите вознаграждение.", example: "Чем больше друзей, тем больше кэшбэка!"), FAQCellModel(question: "Браузерное расширение – что это?", description: "Это надстройка в вашем браузере, которую нужно установить здесь . Когда вы зайдете на любой сайт – расширение оповестит вас, можно ли здесь получить кэшбэк", example: nil)]
    
    
    func FAQCell(indexPath: IndexPath) -> FAQCell{
        let cell = tableView?.dequeueReusableCell(withIdentifier: "FAQCell", for: indexPath) as! FAQCell
        let question = questionsArray[indexPath.row]
        cell.questionLabel.attributedText = attributedString(question: question, lineSpacing: 5)
        cell.selectionStyle = .none
        return cell
    }
    private func attributedString(question: FAQCellModel, lineSpacing: CGFloat) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: question.question)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    func numberOfRows() -> Int{
        return questionsArray.count
    }
    
    func didSelectedRow(indexPath: IndexPath) -> UIViewController{
        let vc = UIStoryboard(name: "Answer", bundle: nil).instantiateViewController(withIdentifier: "AnswerVC") as! AnswerController
        vc.model = questionsArray[indexPath.row]
        return vc
    }
    
    
}
