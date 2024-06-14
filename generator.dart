import 'dart:io';
/*
 di terminal ketik saja
 dart .\generator.dart core core
  dart .\generator.dart feature nama_fitur
 cth. dart .\generator.dart feature login
*/

void main(List args) async {
  var command = args[0];
  var value = args[1];
  switch (command) {
    case "feature":
      FeatureGenerator.generate(value);
      break;
    //-- rdu = repository, dataSource & usecase
    case "core":
      CoreGenerator.generate(value);
      break;
  }
}

class FeatureGenerator {
  static generate(String value) async {
    String featureName = value.split("/")[0];
    var remoteDataSourceFile = File("./lib/features/$value/data/datasource/${featureName}_remote_datasource.dart");
    var localDataSourceFile = File("./lib/features/$value/data/datasource/${featureName}_local_datasource.dart");
    var modelFile = File("./lib/features/$value/data/models/${featureName}_response.dart");
    var repositoryDataFile = File("./lib/features/$value/data/repository/${featureName}_repository_impl.dart");
    var entityFile = File("./lib/features/$value/domain/entities/${featureName}_entity.dart");
    var usecaseFile = File("./lib/features/$value/domain/usecase/${featureName}_usecase.dart");
    var repositoryDomainFile = File("./lib/features/$value/domain/repository/${featureName}_repository.dart");

    // var domainFile = File("./lib/features/$value/view/${featureName}_view.dart");
    var viewFile = File("./lib/features/$value/presentation/view/${featureName}_view.dart");
    var providerFile = File("./lib/features/$value/presentation/provider/${featureName}_provider.dart");
    var emptyWidgetFile = File("./lib/features/$value/presentation/widget/_");

    remoteDataSourceFile.createSync(recursive: true);
    localDataSourceFile.createSync(recursive: true);
    modelFile.createSync(recursive: true);
    repositoryDataFile.createSync(recursive: true);
    entityFile.createSync(recursive: true);
    usecaseFile.createSync(recursive: true);
    repositoryDomainFile.createSync(recursive: true);
    viewFile.createSync(recursive: true);
    providerFile.createSync(recursive: true);
    emptyWidgetFile.createSync(recursive: true);
  }
}

class CoreGenerator {
  static generate(String value) async {
    var constFile = File("./lib/core/constant/constants.dart");
    var datastateFile = File("./lib/core/resources/data_state.dart");
    var usecaseFile = File("./lib/core/usecase/usecase.dart");
    var widgetFile = File("./lib/core/widget/_");
    var utilFile = File("./lib/core/utils/_");

    constFile.createSync(recursive: true);
    datastateFile.createSync(recursive: true);
    usecaseFile.createSync(recursive: true);
    widgetFile.createSync(recursive: true);
    utilFile.createSync(recursive: true);

    datastateFile.writeAsStringSync(await DataStateGenerator.generate(value));
  }
}

class DataStateGenerator {
  static Future<String> generate(String value) async {
    String featureName = value.split("/")[0];
    return """
    abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.error, this.data});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

    """
        .trim();
  }
}
