; ModuleID = 'src/locale/langinfo.c'
source_filename = "src/locale/langinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@.str = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"ASCII\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@c_numeric = internal constant [3 x i8] c".\00\00", align 1
@c_time = internal constant [316 x i8] c"Sun\00Mon\00Tue\00Wed\00Thu\00Fri\00Sat\00Sunday\00Monday\00Tuesday\00Wednesday\00Thursday\00Friday\00Saturday\00Jan\00Feb\00Mar\00Apr\00May\00Jun\00Jul\00Aug\00Sep\00Oct\00Nov\00Dec\00January\00February\00March\00April\00May\00June\00July\00August\00September\00October\00November\00December\00AM\00PM\00%a %b %e %T %Y\00%m/%d/%y\00%H:%M:%S\00%I:%M:%S %p\00\00\00%m/%d/%y\000123456789\00%a %b %e %T %Y\00%H:%M:%S\00", align 16
@c_messages = internal constant [19 x i8] c"^[yY]\00^[nN]\00yes\00no\00", align 16

@nl_langinfo = weak alias i8* (i32), i8* (i32)* @__nl_langinfo
@nl_langinfo_l = weak alias i8* (i32, %struct.__locale_struct*), i8* (i32, %struct.__locale_struct*)* @__nl_langinfo_l

; Function Attrs: nounwind optsize strictfp
define i8* @__nl_langinfo_l(i32 noundef %0, %struct.__locale_struct* nocapture noundef readonly %1) #0 {
  %3 = ashr i32 %0, 16
  %4 = and i32 %0, 65535
  %5 = icmp eq i32 %0, 14
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %1, i64 0, i32 0, i64 0
  %8 = load %struct.__locale_map*, %struct.__locale_map** %7, align 8, !tbaa !3
  %9 = icmp eq %struct.__locale_map* %8, null
  %10 = select i1 %9, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)
  br label %57

11:                                               ; preds = %2
  %12 = icmp eq i32 %4, 65535
  %13 = icmp slt i32 %0, 393216
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %22

15:                                               ; preds = %11
  %16 = sext i32 %3 to i64
  %17 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %1, i64 0, i32 0, i64 %16
  %18 = load %struct.__locale_map*, %struct.__locale_map** %17, align 8, !tbaa !3
  %19 = icmp eq %struct.__locale_map* %18, null
  %20 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %18, i64 0, i32 2, i64 0
  %21 = select i1 %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8* %20
  br label %57

22:                                               ; preds = %11
  switch i32 %3, label %57 [
    i32 1, label %23
    i32 2, label %25
    i32 4, label %27
    i32 5, label %29
  ]

23:                                               ; preds = %22
  %24 = icmp ugt i32 %4, 1
  br i1 %24, label %57, label %31

25:                                               ; preds = %22
  %26 = icmp ugt i32 %4, 49
  br i1 %26, label %57, label %31

27:                                               ; preds = %22
  %28 = icmp eq i32 %4, 0
  br i1 %28, label %48, label %57

29:                                               ; preds = %22
  %30 = icmp ugt i32 %4, 3
  br i1 %30, label %57, label %31

31:                                               ; preds = %29, %25, %23
  %32 = phi i8* [ getelementptr inbounds ([3 x i8], [3 x i8]* @c_numeric, i64 0, i64 0), %23 ], [ getelementptr inbounds ([316 x i8], [316 x i8]* @c_time, i64 0, i64 0), %25 ], [ getelementptr inbounds ([19 x i8], [19 x i8]* @c_messages, i64 0, i64 0), %29 ]
  %33 = icmp eq i32 %4, 0
  br i1 %33, label %45, label %34

34:                                               ; preds = %31, %42
  %35 = phi i8* [ %41, %42 ], [ %32, %31 ]
  %36 = phi i32 [ %43, %42 ], [ %4, %31 ]
  br label %37

37:                                               ; preds = %37, %34
  %38 = phi i8* [ %41, %37 ], [ %35, %34 ]
  %39 = load i8, i8* %38, align 1, !tbaa !7
  %40 = icmp eq i8 %39, 0
  %41 = getelementptr inbounds i8, i8* %38, i64 1
  br i1 %40, label %42, label %37

42:                                               ; preds = %37
  %43 = add nsw i32 %36, -1
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %34

45:                                               ; preds = %42, %31
  %46 = phi i8* [ %32, %31 ], [ %41, %42 ]
  %47 = icmp eq i32 %3, 1
  br i1 %47, label %57, label %48

48:                                               ; preds = %27, %45
  %49 = phi i8* [ %46, %45 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %27 ]
  %50 = load i8, i8* %49, align 1, !tbaa !7
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %57, label %52

52:                                               ; preds = %48
  %53 = sext i32 %3 to i64
  %54 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %1, i64 0, i32 0, i64 %53
  %55 = load %struct.__locale_map*, %struct.__locale_map** %54, align 8, !tbaa !3
  %56 = tail call i8* @__lctrans(i8* noundef nonnull %49, %struct.__locale_map* noundef %55) #2
  br label %57

57:                                               ; preds = %45, %48, %52, %22, %29, %27, %25, %23, %15, %6
  %58 = phi i8* [ %10, %6 ], [ %21, %15 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %23 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %25 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %27 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %29 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i64 0, i64 0), %22 ], [ %56, %52 ], [ %49, %48 ], [ %46, %45 ]
  ret i8* %58
}

; Function Attrs: optsize
declare hidden i8* @__lctrans(i8* noundef, %struct.__locale_map* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @__nl_langinfo(i32 noundef %0) #0 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !8
  %3 = inttoptr i64 %2 to %struct.__pthread*
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 24
  %5 = load %struct.__locale_struct*, %struct.__locale_struct** %4, align 8, !tbaa !9
  %6 = tail call i8* @__nl_langinfo_l(i32 noundef %0, %struct.__locale_struct* noundef %5) #4
  ret i8* %6
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind readnone strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{i64 263897}
!9 = !{!10, !4, i64 168}
!10 = !{!"__pthread", !4, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !11, i64 32, !11, i64 40, !12, i64 48, !12, i64 52, !12, i64 56, !12, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !4, i64 72, !11, i64 80, !4, i64 88, !11, i64 96, !11, i64 104, !4, i64 112, !4, i64 120, !4, i64 128, !13, i64 136, !12, i64 160, !12, i64 164, !4, i64 168, !5, i64 176, !4, i64 184, !4, i64 192}
!11 = !{!"long", !5, i64 0}
!12 = !{!"int", !5, i64 0}
!13 = !{!"", !4, i64 0, !11, i64 8, !4, i64 16}
