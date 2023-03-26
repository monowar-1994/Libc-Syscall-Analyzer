; ModuleID = 'src/env/__init_tls.c'
source_filename = "src/env/__init_tls.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.builtin_tls = type { i8, %struct.__pthread, [16 x i8*] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.Elf64_Phdr = type { i32, i32, i64, i64, i64, i64, i64, i64 }

@__libc = external hidden global %struct.__libc, align 8
@__thread_list_lock = hidden global i32 0, align 4
@__sysinfo = external hidden local_unnamed_addr global i64, align 8
@_DYNAMIC = extern_weak hidden constant [0 x i64], align 8
@__default_stacksize = external hidden local_unnamed_addr global i32, align 4
@main_tls = internal global %struct.tls_module zeroinitializer, align 8
@builtin_tls = internal global [1 x %struct.builtin_tls] zeroinitializer, align 16

@__init_tls = weak hidden alias void (i64*), void (i64*)* @static_init_tls

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__init_tp(i8* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to i8**
  store i8* %0, i8** %2, align 8, !tbaa !3
  %3 = tail call i32 @__set_thread_area(i8* noundef %0) #2
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %26, label %5

5:                                                ; preds = %1
  %6 = icmp eq i32 %3, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %5
  store i8 1, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 0), align 8, !tbaa !11
  br label %8

8:                                                ; preds = %7, %5
  %9 = getelementptr inbounds i8, i8* %0, i64 56
  %10 = bitcast i8* %9 to i32*
  store volatile i32 2, i32* %10, align 8, !tbaa !14
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 218, i64 ptrtoint (i32* @__thread_list_lock to i64)) #3, !srcloc !15
  %12 = trunc i64 %11 to i32
  %13 = getelementptr inbounds i8, i8* %0, i64 48
  %14 = bitcast i8* %13 to i32*
  store i32 %12, i32* %14, align 8, !tbaa !16
  %15 = getelementptr inbounds i8, i8* %0, i64 168
  %16 = bitcast i8* %15 to %struct.__locale_struct**
  store %struct.__locale_struct* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 11), %struct.__locale_struct** %16, align 8, !tbaa !17
  %17 = getelementptr inbounds i8, i8* %0, i64 136
  %18 = bitcast i8* %17 to i8**
  store volatile i8* %17, i8** %18, align 8, !tbaa !18
  %19 = load i64, i64* @__sysinfo, align 8, !tbaa !19
  %20 = getelementptr inbounds i8, i8* %0, i64 32
  %21 = bitcast i8* %20 to i64*
  store i64 %19, i64* %21, align 8, !tbaa !20
  %22 = getelementptr inbounds i8, i8* %0, i64 16
  %23 = bitcast i8* %22 to i8**
  store i8* %0, i8** %23, align 8, !tbaa !21
  %24 = getelementptr inbounds i8, i8* %0, i64 24
  %25 = bitcast i8* %24 to i8**
  store i8* %0, i8** %25, align 8, !tbaa !22
  br label %26

26:                                               ; preds = %1, %8
  %27 = phi i32 [ 0, %8 ], [ -1, %1 ]
  ret i32 %27
}

; Function Attrs: optsize
declare hidden i32 @__set_thread_area(i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__copy_tls(i8* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to i64*
  %3 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !23
  %4 = add i64 %3, -200
  %5 = getelementptr inbounds i8, i8* %0, i64 %4
  %6 = ptrtoint i8* %5 to i64
  %7 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 8), align 8, !tbaa !24
  %8 = add i64 %7, -1
  %9 = and i64 %8, %6
  %10 = sub i64 0, %9
  %11 = getelementptr inbounds i8, i8* %5, i64 %10
  %12 = load %struct.tls_module*, %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6), align 8, !tbaa !25
  %13 = icmp eq %struct.tls_module* %12, null
  br i1 %13, label %35, label %14

14:                                               ; preds = %1, %14
  %15 = phi %struct.tls_module* [ %33, %14 ], [ %12, %1 ]
  %16 = phi i64 [ %31, %14 ], [ 1, %1 ]
  %17 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %15, i64 0, i32 5
  %18 = load i64, i64* %17, align 8, !tbaa !26
  %19 = sub i64 0, %18
  %20 = getelementptr inbounds i8, i8* %11, i64 %19
  %21 = ptrtoint i8* %20 to i64
  %22 = getelementptr inbounds i64, i64* %2, i64 %16
  store i64 %21, i64* %22, align 8, !tbaa !19
  %23 = load i64, i64* %17, align 8, !tbaa !26
  %24 = sub i64 0, %23
  %25 = getelementptr inbounds i8, i8* %11, i64 %24
  %26 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %15, i64 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !28
  %28 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %15, i64 0, i32 2
  %29 = load i64, i64* %28, align 8, !tbaa !29
  %30 = tail call i8* @memcpy(i8* noundef %25, i8* noundef %27, i64 noundef %29) #2
  %31 = add i64 %16, 1
  %32 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %15, i64 0, i32 0
  %33 = load %struct.tls_module*, %struct.tls_module** %32, align 8, !tbaa !25
  %34 = icmp eq %struct.tls_module* %33, null
  br i1 %34, label %35, label %14

35:                                               ; preds = %14, %1
  %36 = load i64, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 9), align 8, !tbaa !30
  store i64 %36, i64* %2, align 8, !tbaa !19
  %37 = getelementptr inbounds i8, i8* %11, i64 8
  %38 = bitcast i8* %37 to i8**
  store i8* %0, i8** %38, align 8, !tbaa !31
  ret i8* %11
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal void @static_init_tls(i64* nocapture noundef readonly %0) #0 {
  %2 = getelementptr inbounds i64, i64* %0, i64 3
  %3 = load i64, i64* %2, align 8, !tbaa !19
  %4 = getelementptr inbounds i64, i64* %0, i64 5
  %5 = load i64, i64* %4, align 8, !tbaa !19
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %67, label %7

7:                                                ; preds = %1
  %8 = inttoptr i64 %3 to i8*
  %9 = getelementptr inbounds i64, i64* %0, i64 4
  %10 = load i64, i64* %9, align 8, !tbaa !19
  br label %11

11:                                               ; preds = %7, %48
  %12 = phi i64 [ 0, %7 ], [ %50, %48 ]
  %13 = phi %struct.Elf64_Phdr* [ null, %7 ], [ %49, %48 ]
  %14 = phi i8* [ %8, %7 ], [ %52, %48 ]
  %15 = phi i64 [ %5, %7 ], [ %51, %48 ]
  %16 = bitcast i8* %14 to %struct.Elf64_Phdr*
  %17 = bitcast i8* %14 to i32*
  %18 = load i32, i32* %17, align 8, !tbaa !32
  %19 = icmp eq i32 %18, 6
  br i1 %19, label %20, label %25

20:                                               ; preds = %11
  %21 = getelementptr inbounds i8, i8* %14, i64 16
  %22 = bitcast i8* %21 to i64*
  %23 = load i64, i64* %22, align 8, !tbaa !34
  %24 = sub i64 %3, %23
  br label %48

25:                                               ; preds = %11
  %26 = icmp ne i32 %18, 2
  %27 = or i1 %26, icmp eq (i64* getelementptr inbounds ([0 x i64], [0 x i64]* @_DYNAMIC, i64 0, i64 0), i64* null)
  br i1 %27, label %33, label %28

28:                                               ; preds = %25
  %29 = getelementptr inbounds i8, i8* %14, i64 16
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !34
  %32 = sub i64 ptrtoint ([0 x i64]* @_DYNAMIC to i64), %31
  br label %48

33:                                               ; preds = %25
  %34 = icmp eq i32 %18, 7
  %35 = select i1 %34, %struct.Elf64_Phdr* %16, %struct.Elf64_Phdr* %13
  %36 = icmp eq i32 %18, 1685382481
  br i1 %36, label %37, label %48

37:                                               ; preds = %33
  %38 = getelementptr inbounds i8, i8* %14, i64 40
  %39 = bitcast i8* %38 to i64*
  %40 = load i64, i64* %39, align 8, !tbaa !35
  %41 = load i32, i32* @__default_stacksize, align 4, !tbaa !36
  %42 = zext i32 %41 to i64
  %43 = icmp ugt i64 %40, %42
  br i1 %43, label %44, label %48

44:                                               ; preds = %37
  %45 = icmp ult i64 %40, 8388608
  %46 = select i1 %45, i64 %40, i64 8388608
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* @__default_stacksize, align 4, !tbaa !36
  br label %48

48:                                               ; preds = %28, %20, %33, %37, %44
  %49 = phi %struct.Elf64_Phdr* [ %35, %33 ], [ %35, %37 ], [ %35, %44 ], [ %13, %20 ], [ %13, %28 ]
  %50 = phi i64 [ %12, %33 ], [ %12, %37 ], [ %12, %44 ], [ %24, %20 ], [ %32, %28 ]
  %51 = add i64 %15, -1
  %52 = getelementptr inbounds i8, i8* %14, i64 %10
  %53 = icmp eq i64 %51, 0
  br i1 %53, label %54, label %11

54:                                               ; preds = %48
  %55 = icmp eq %struct.Elf64_Phdr* %49, null
  br i1 %55, label %67, label %56

56:                                               ; preds = %54
  %57 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %49, i64 0, i32 3
  %58 = load i64, i64* %57, align 8, !tbaa !34
  %59 = add i64 %58, %50
  %60 = inttoptr i64 %59 to i8*
  store i8* %60, i8** getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 1), align 8, !tbaa !28
  %61 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %49, i64 0, i32 5
  %62 = load i64, i64* %61, align 8, !tbaa !37
  store i64 %62, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 2), align 8, !tbaa !29
  %63 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %49, i64 0, i32 6
  %64 = load i64, i64* %63, align 8, !tbaa !35
  %65 = getelementptr inbounds %struct.Elf64_Phdr, %struct.Elf64_Phdr* %49, i64 0, i32 7
  %66 = load i64, i64* %65, align 8, !tbaa !38
  store i64 %66, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 4), align 8, !tbaa !39
  store i64 1, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 9), align 8, !tbaa !30
  store %struct.tls_module* @main_tls, %struct.tls_module** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6), align 8, !tbaa !40
  br label %71

67:                                               ; preds = %1, %54
  %68 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 4), align 8, !tbaa !39
  %69 = load i64, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 3), align 8, !tbaa !41
  %70 = load i8*, i8** getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 1), align 8, !tbaa !28
  br label %71

71:                                               ; preds = %67, %56
  %72 = phi i8* [ %70, %67 ], [ %60, %56 ]
  %73 = phi i64 [ %69, %67 ], [ %64, %56 ]
  %74 = phi i64 [ %68, %67 ], [ %66, %56 ]
  %75 = ptrtoint i8* %72 to i64
  %76 = add i64 %73, %75
  %77 = sub i64 0, %76
  %78 = add i64 %74, -1
  %79 = and i64 %78, %77
  %80 = add i64 %79, %73
  store i64 %80, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 3), align 8, !tbaa !41
  store i64 %80, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 5), align 8, !tbaa !26
  %81 = icmp ult i64 %74, 8
  br i1 %81, label %82, label %83

82:                                               ; preds = %71
  store i64 8, i64* getelementptr inbounds (%struct.tls_module, %struct.tls_module* @main_tls, i64 0, i32 4), align 8, !tbaa !39
  br label %83

83:                                               ; preds = %82, %71
  %84 = phi i64 [ 8, %82 ], [ %74, %71 ]
  store i64 %84, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 8), align 8, !tbaa !24
  %85 = add i64 %80, 223
  %86 = add i64 %85, %84
  %87 = and i64 %86, -8
  store i64 %87, i64* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 7), align 8, !tbaa !23
  %88 = icmp ugt i64 %87, 336
  br i1 %88, label %89, label %92

89:                                               ; preds = %83
  %90 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 9, i64 0, i64 %87, i64 3, i64 34, i64 -1, i64 0) #3, !srcloc !42
  %91 = inttoptr i64 %90 to i8*
  br label %92

92:                                               ; preds = %83, %89
  %93 = phi i8* [ %91, %89 ], [ getelementptr inbounds ([1 x %struct.builtin_tls], [1 x %struct.builtin_tls]* @builtin_tls, i64 0, i64 0, i32 0), %83 ]
  %94 = tail call i8* @__copy_tls(i8* noundef %93) #4
  %95 = tail call i32 @__init_tp(i8* noundef %94) #4
  %96 = icmp slt i32 %95, 0
  br i1 %96, label %97, label %98

97:                                               ; preds = %92
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !43
  br label %98

98:                                               ; preds = %97, %92
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 52, !9, i64 56, !9, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !8, i64 80, !5, i64 88, !8, i64 96, !8, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !10, i64 136, !9, i64 160, !9, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"", !5, i64 0, !8, i64 8, !5, i64 16}
!11 = !{!12, !6, i64 0}
!12 = !{!"__libc", !6, i64 0, !6, i64 1, !6, i64 2, !6, i64 3, !9, i64 4, !5, i64 8, !5, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !13, i64 56}
!13 = !{!"__locale_struct", !6, i64 0}
!14 = !{!4, !9, i64 56}
!15 = !{i64 329679}
!16 = !{!4, !9, i64 48}
!17 = !{!4, !5, i64 168}
!18 = !{!4, !5, i64 136}
!19 = !{!8, !8, i64 0}
!20 = !{!4, !8, i64 32}
!21 = !{!4, !5, i64 16}
!22 = !{!4, !5, i64 24}
!23 = !{!12, !8, i64 24}
!24 = !{!12, !8, i64 32}
!25 = !{!5, !5, i64 0}
!26 = !{!27, !8, i64 40}
!27 = !{!"tls_module", !5, i64 0, !5, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!28 = !{!27, !5, i64 8}
!29 = !{!27, !8, i64 16}
!30 = !{!12, !8, i64 40}
!31 = !{!4, !5, i64 8}
!32 = !{!33, !9, i64 0}
!33 = !{!"", !9, i64 0, !9, i64 4, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48}
!34 = !{!33, !8, i64 16}
!35 = !{!33, !8, i64 40}
!36 = !{!9, !9, i64 0}
!37 = !{!33, !8, i64 32}
!38 = !{!33, !8, i64 48}
!39 = !{!27, !8, i64 32}
!40 = !{!12, !5, i64 16}
!41 = !{!27, !8, i64 24}
!42 = !{i64 331056}
!43 = !{i64 344592}
