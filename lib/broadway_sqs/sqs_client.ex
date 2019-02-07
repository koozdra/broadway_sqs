defmodule BroadwaySQS.SQSClient do
  @moduledoc """
  A generic behaviour to implement SQS CLients for `BroadwaySQS.SQSProducer`.
  This module defines callbacks to normalize options and receive message
  from a SQS queue. Modules that implement this behaviour should be passed
  as the `:sqs_client` option from `BroadwaySQS.SQSProducer`.

  """

  alias Broadway.Message

  @type messages :: [Message.t()]

  @callback init(opts :: any) :: {:ok, normalized_opts :: any} | {:error, message :: binary}
  @callback receive_messages(demand :: pos_integer, opts :: any) :: messages
end