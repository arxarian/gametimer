cmake_minimum_required(VERSION 3.16)

project(GameTimer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(RESOURCE_FILES images/images.qrc)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appGameTimer
    sources/main.cpp
)

qt_add_resources(RESOURCES ${RESOURCE_FILES})

set(QT_QML_GENERATE_QMLLS_INI ON)

qt_add_qml_module(appGameTimer
    URI GameTimer
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/HeadItem.qml
        qml/FooterItem.qml
        qml/PlayersView.qml
        qml/TurnsView.qml
        qml/EnterNameDialog.qml
    RESOURCES
        android/AndroidManifest.xml
        android/build.gradle
        android/res/values/libs.xml
        android/res/xml/qtprovider_paths.xml
        android/gradle/wrapper/gradle-wrapper.jar
        android/gradle/wrapper/gradle-wrapper.properties
        android/gradle.properties android/gradlew
        android/gradlew.bat
        images/images.qrc
    SOURCES
        sources/gamedata.h
        sources/gamedata.cpp
        sources/playermodel.h
        sources/playermodel.cpp
        sources/playeritem.h
        sources/playeritem.cpp
        sources/turnmodel.h
        sources/turnmodel.cpp
        sources/turnitem.h
        sources/turnitem.cpp
        sources/countuptimer.h
        sources/countuptimer.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGameTimer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGameTimer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_include_directories(appGameTimer PRIVATE
    sources
)

target_sources(appGameTimer PRIVATE ${RESOURCES})

target_link_libraries(appGameTimer
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appGameTimer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
