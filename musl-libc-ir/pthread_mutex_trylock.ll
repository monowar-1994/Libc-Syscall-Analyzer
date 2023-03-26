; ModuleID = 'src/thread/pthread_mutex_trylock.c'
source_filename = "src/thread/pthread_mutex_trylock.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_mutex_t = type { %union.anon }
%union.anon = type { [5 x i8*] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@pthread_mutex_trylock = weak alias i32 (%struct.pthread_mutex_t*), i32 (%struct.pthread_mutex_t*)* @__pthread_mutex_trylock

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_mutex_trylock_owner(%struct.pthread_mutex_t* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %3 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %4 = load i32, i32* %3, align 8, !tbaa !3
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !6
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 6
  %8 = load i32, i32* %7, align 8, !tbaa !7
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %10 = load volatile i32, i32* %9, align 4, !tbaa !3
  %11 = and i32 %10, 1073741823
  %12 = icmp eq i32 %11, %8
  br i1 %12, label %13, label %31

13:                                               ; preds = %1
  %14 = and i32 %4, 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %22, label %16

16:                                               ; preds = %13
  %17 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %18 = load i32, i32* %17, align 4, !tbaa !3
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = and i32 %10, 1073741824
  store i32 0, i32* %17, align 4, !tbaa !3
  br label %78

22:                                               ; preds = %16, %13
  %23 = and i32 %4, 3
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %31

25:                                               ; preds = %22
  %26 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %27 = load i32, i32* %26, align 4, !tbaa !3
  %28 = icmp ugt i32 %27, 2147483646
  br i1 %28, label %113, label %29

29:                                               ; preds = %25
  %30 = add nuw nsw i32 %27, 1
  store i32 %30, i32* %26, align 4, !tbaa !3
  br label %113

31:                                               ; preds = %22, %1
  switch i32 %11, label %37 [
    i32 1073741823, label %113
    i32 0, label %32
  ]

32:                                               ; preds = %31
  %33 = icmp ne i32 %10, 0
  %34 = and i32 %4, 4
  %35 = icmp eq i32 %34, 0
  %36 = select i1 %33, i1 %35, i1 false
  br i1 %36, label %37, label %38

37:                                               ; preds = %32, %31
  br label %113

38:                                               ; preds = %32
  %39 = and i32 %4, 128
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %59, label %41

41:                                               ; preds = %38
  %42 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21, i32 1
  %43 = load i64, i64* %42, align 8, !tbaa !13
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %41
  %46 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21
  store i64 -28, i64* %42, align 8, !tbaa !13
  %47 = ptrtoint %struct.anon* %46 to i64
  %48 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 273, i64 %47, i64 24) #2, !srcloc !14
  br label %49

49:                                               ; preds = %45, %41
  %50 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %51 = bitcast i8** %50 to i32*
  %52 = load volatile i32, i32* %51, align 8, !tbaa !3
  %53 = icmp eq i32 %52, 0
  %54 = or i32 %8, -2147483648
  %55 = select i1 %53, i32 %8, i32 %54
  %56 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 4
  %57 = bitcast i8** %56 to i8*
  %58 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21, i32 2
  store volatile i8* %57, i8** %58, align 8, !tbaa !15
  br label %59

59:                                               ; preds = %49, %38
  %60 = phi i32 [ %55, %49 ], [ %8, %38 ]
  %61 = and i32 %10, 1073741824
  %62 = or i32 %60, %61
  %63 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %9, i32 %10, i32 %62) #2, !srcloc !16
  %64 = icmp eq i32 %63, %10
  br i1 %64, label %75, label %65

65:                                               ; preds = %59
  %66 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %66, align 8, !tbaa !15
  %67 = and i32 %4, 12
  %68 = icmp eq i32 %67, 12
  br i1 %68, label %69, label %74

69:                                               ; preds = %65
  %70 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %71 = bitcast i8** %70 to i32*
  %72 = load volatile i32, i32* %71, align 8, !tbaa !3
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %113

74:                                               ; preds = %69, %65
  br label %113

75:                                               ; preds = %59
  %76 = and i32 %4, 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %94, label %78

78:                                               ; preds = %20, %75
  %79 = phi i32 [ %21, %20 ], [ %10, %75 ]
  %80 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 1
  %81 = bitcast i8** %80 to i32*
  %82 = load volatile i32, i32* %81, align 8, !tbaa !3
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %94, label %84

84:                                               ; preds = %78
  %85 = and i32 %4, 128
  %86 = ptrtoint i32* %9 to i64
  %87 = xor i32 %85, 135
  %88 = zext i32 %87 to i64
  %89 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %86, i64 %88) #2, !srcloc !14
  %90 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %90, align 8, !tbaa !15
  %91 = and i32 %4, 4
  %92 = icmp eq i32 %91, 0
  %93 = select i1 %92, i32 16, i32 131
  br label %113

94:                                               ; preds = %78, %75
  %95 = phi i32 [ %79, %78 ], [ %10, %75 ]
  %96 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21
  %97 = getelementptr inbounds %struct.anon, %struct.anon* %96, i64 0, i32 0
  %98 = load volatile i8*, i8** %97, align 8, !tbaa !17
  %99 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 4
  store volatile i8* %98, i8** %99, align 8, !tbaa !3
  %100 = bitcast %struct.anon* %96 to i8*
  %101 = getelementptr inbounds %struct.pthread_mutex_t, %struct.pthread_mutex_t* %0, i64 0, i32 0, i32 0, i64 3
  store volatile i8* %100, i8** %101, align 8, !tbaa !3
  %102 = icmp eq i8* %98, %100
  br i1 %102, label %107, label %103

103:                                              ; preds = %94
  %104 = bitcast i8** %99 to i8*
  %105 = getelementptr inbounds i8, i8* %98, i64 -8
  %106 = bitcast i8* %105 to i8**
  store volatile i8* %104, i8** %106, align 8, !tbaa !18
  br label %107

107:                                              ; preds = %94, %103
  %108 = bitcast i8** %99 to i8*
  store volatile i8* %108, i8** %97, align 8, !tbaa !17
  %109 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 21, i32 2
  store volatile i8* null, i8** %109, align 8, !tbaa !15
  %110 = icmp eq i32 %95, 0
  br i1 %110, label %113, label %111

111:                                              ; preds = %107
  %112 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 0, i32* %112, align 4, !tbaa !3
  br label %113

113:                                              ; preds = %107, %69, %31, %25, %111, %84, %74, %37, %29
  %114 = phi i32 [ %93, %84 ], [ 130, %111 ], [ 0, %29 ], [ 16, %37 ], [ 16, %74 ], [ 11, %25 ], [ 131, %31 ], [ 131, %69 ], [ 0, %107 ]
  ret i32 %114
}

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__pthread_mutex_trylock(%struct.pthread_mutex_t* noundef %0) #0 {
  %2 = bitcast %struct.pthread_mutex_t* %0 to i32*
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = and i32 %3, 15
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = bitcast %struct.pthread_mutex_t* %0 to [10 x i32]*
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %7, i64 0, i64 1
  %9 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %8, i32 0, i32 16) #2, !srcloc !16
  %10 = and i32 %9, 16
  br label %13

11:                                               ; preds = %1
  %12 = tail call i32 @__pthread_mutex_trylock_owner(%struct.pthread_mutex_t* noundef nonnull %0) #3
  br label %13

13:                                               ; preds = %11, %6
  %14 = phi i32 [ %10, %6 ], [ %12, %11 ]
  ret i32 %14
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 235825}
!7 = !{!8, !11, i64 48}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !4, i64 64, !4, i64 65, !4, i64 66, !4, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !12, i64 136, !11, i64 160, !11, i64 164, !9, i64 168, !4, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!13 = !{!8, !10, i64 144}
!14 = !{i64 205496}
!15 = !{!8, !9, i64 152}
!16 = !{i64 232801}
!17 = !{!8, !9, i64 136}
!18 = !{!9, !9, i64 0}
