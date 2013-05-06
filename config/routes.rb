BudgetCalculator::Application.routes.draw do
  resources :budgets
  root to: "budgets#new"
end
