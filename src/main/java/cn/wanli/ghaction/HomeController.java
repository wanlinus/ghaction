package cn.wanli.ghaction;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wanli
 */
@RestController
public class HomeController {

    @GetMapping
    public String asd() {
        return "this is home page";
    }
}
