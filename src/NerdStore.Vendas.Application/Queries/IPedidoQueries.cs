﻿using NerdStore.Vendas.Application.Queries.ViewModels;
using NerdStore.Vendas.Domain;

namespace NerdStore.Vendas.Application.Queries
{
    public interface IPedidoQueries
    {
        Task<CarrinhoViewModel> ObterCarrinhoCliente(Guid clienteId);
        Task<IEnumerable<PedidoViewModel>> ObterPedidosCliente(Guid clienteId);
        Task<PedidoDetalheViewModel> ObterPedidoDetalhe(Guid pedidoId);
    }

    public class PedidoQueries : IPedidoQueries
    {
        private readonly IPedidoRepository _pedidoRepository;

        public PedidoQueries(IPedidoRepository pedidoRepository)
        {
            _pedidoRepository = pedidoRepository;
        }

        public async Task<CarrinhoViewModel> ObterCarrinhoCliente(Guid clienteId)
        {
            var pedido = await _pedidoRepository.ObterPedidoRascunhoPorClienteId(clienteId);
            if (pedido is null) return null;
            var carrinho = new CarrinhoViewModel()
            {
                ClienteId = pedido.ClienteId,
                ValorTotal = pedido.ValorTotal,
                PedidoId = clienteId,
                ValorDesconto = pedido.Desconto,
                SubTotal = pedido.Desconto + pedido.ValorTotal
            };

            if (pedido.VoucherId != null)
            {
                carrinho.VoucherCodigo = pedido.Voucher.Codigo;
            }

            foreach (var item in pedido.PedidoItems)
            {
                carrinho.Items.Add(new CarrinhoItemViewModel()
                {
                    ProdutoId = item.ProdutoId,
                    ProdutoNome = item.ProdutoNome,
                    Quantidade = item.Quantidade,
                    ValorUnitario = item.ValorUnitario,
                    ValorTotal = item.ValorUnitario * item.Quantidade,
                });
            }
            return carrinho;
        }

        public async Task<PedidoDetalheViewModel> ObterPedidoDetalhe(Guid pedidoId)
        {
            var pedido = await _pedidoRepository.ObterPorId(pedidoId);

            if (pedido is null) return null;

            return new PedidoDetalheViewModel
            {
                ClienteId = pedido.ClienteId,
                Codigo = pedido.Codigo,
                DataCadastro = pedido.DataCadastro,
                Desconto = pedido.Desconto,
                ItensPedido = pedido.PedidoItems.Select(item => new ItemPedidoViewModel
                {
                    PedidoId = pedido.Id,
                    ProdutoId = item.ProdutoId,
                    ProdutoNome = item.ProdutoNome,
                    Quantidade = item.Quantidade,
                    ValorUnitario = item.ValorUnitario
                }).ToList(),
                PedidoStatus = pedido.PedidoStatus,
                ValorTotal = pedido.ValorTotal,
                VoucherId = pedido.VoucherId,
                VoucherUtilizado = pedido.VoucherUtilizado,
            };
        }

        public async Task<IEnumerable<PedidoViewModel>> ObterPedidosCliente(Guid clienteId)
        {
            var pedidos = await _pedidoRepository.ObterListaPorClienteId(clienteId);

            pedidos = pedidos.Where(p => p.PedidoStatus == PedidoStatus.Pago || p.PedidoStatus == PedidoStatus.Cancelado)
                .OrderByDescending(p => p.Codigo);

            if (!pedidos.Any()) return null;

            var pedidosView = new List<PedidoViewModel>();

            foreach (var pedido in pedidos)
            {
                pedidosView.Add(new PedidoViewModel
                {
                    Id = pedido.Id,
                    ValorTotal = pedido.ValorTotal,
                    PedidoStatus = (int)pedido.PedidoStatus,
                    Codigo = pedido.Codigo,
                    DataCadastro = pedido.DataCadastro,
                    StatusDescricao = pedido.PedidoStatus.ToString(),
                });
            }

            return pedidosView;
        }
    }

}
