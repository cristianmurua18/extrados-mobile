enum ResultType { success, failure, error }

// Enum para definir el tipo de resultado de la API
class ApiResult {
  
  final ResultType resultType;
  
  final int? statusCode;
  
  final dynamic body;
  // El cuerpo de la respuesta puede ser de cualquier tipo, por eso es dynamic

  ApiResult.success({
    this.resultType = ResultType.success,
    this.body,
    this.statusCode,
  });

  ApiResult.failure({
    this.resultType = ResultType.failure,
    this.body,
    this.statusCode,
  });

  ApiResult.error({
    this.resultType = ResultType.error,
    this.body,
    this.statusCode,
  });
}
