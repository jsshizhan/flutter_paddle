# flutter_paddle

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

在模拟器上运行条件：
1、需要在setting.gradle最下面添加：
gradle.beforeProject({ project->
    if (project.hasProperty("target-platform") && !project.getProperty("target-platform").split(",").contains("android-arm64")) {
        project.setProperty("target-platform", "android-arm64,android-arm")
    }
})
2、需要用64位模拟器