package com.app.webapp.controller;

import com.app.webapp.domain.*;
import com.app.webapp.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static com.app.webapp.config.EntityKey.*;

@Controller
public class MainController {

  @Autowired
  private CodexRepo codexRepo;
  @Autowired
  private CompanyRepo companyRepo;
  @Autowired
  private CurrencyRepo currencyRepo;
  @Autowired
  private EmployeeRepo employeeRepo;
  @Autowired
  private PaymentRepo paymentRepo;

  @GetMapping("/greeting")
  public String greeting(@RequestParam(name = "user_name", required = false, defaultValue = "User!") String userName,
                         Model model) {
    model.addAttribute("user_name", userName);
    return "greeting";
  }

  @GetMapping("/")
  public String main(@AuthenticationPrincipal User user,
                     @RequestParam(required = false, defaultValue = "") String countryName,
                     Model model) {
    refreshTables(model);


    model.addAttribute("user", user);

    return "main";
  }

  /**
   * Puts all the tables to the model containers.
   *
   * @param model
   */
  private void refreshTables(Model model) {
    model.addAttribute(EMPLOYEES.getKey(), employeeRepo.findAll());
    model.addAttribute(COMPANIES.getKey(), companyRepo.findAll());
    model.addAttribute(CURRENCY.getKey(), currencyRepo.findAll());
    model.addAttribute(CODEX.getKey(), codexRepo.findAll());
    model.addAttribute(PAYMENTS.getKey(), paymentRepo.findAll());
  }

}
