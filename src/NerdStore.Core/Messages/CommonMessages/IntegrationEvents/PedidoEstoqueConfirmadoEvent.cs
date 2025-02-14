﻿using NerdStore.Core.DomainObjects.DTO;

namespace NerdStore.Core.Messages.CommonMessages.IntegrationEvents
{
    public class PedidoEstoqueConfirmadoEvent : IntegrationEvent
    {
        public Guid PedidoId { get; private set; }
        public Guid ClienteId { get; private set; }
        public decimal Total { get; private set; }
        public string TipoPagamento { get; private set; }
        public ListaProdutosPedido ProdutosPedido { get; private set; }

        public PedidoEstoqueConfirmadoEvent(Guid pedidoId, Guid clienteId, decimal total, string tipoPagamento, ListaProdutosPedido produtosPedido)
        {
            AggregateId = pedidoId;
            PedidoId = pedidoId;
            ClienteId = clienteId;
            Total = total;
            TipoPagamento = tipoPagamento;
            ProdutosPedido = produtosPedido;
        }
    }
}