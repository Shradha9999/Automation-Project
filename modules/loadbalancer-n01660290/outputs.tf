output "lb_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.assignment1lb.name
}

output "lb_id" {
  value = azurerm_lb.assignment1lb.id
}


output "lb_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.lb_backend_pool.id
}

