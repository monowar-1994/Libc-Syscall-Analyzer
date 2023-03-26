; ModuleID = 'src/prng/random.c'
source_filename = "src/prng/random.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@lock = internal global [1 x i32] zeroinitializer, align 4
@__random_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0), align 8
@n = internal unnamed_addr global i32 31, align 4
@x = internal unnamed_addr global i32* getelementptr inbounds ([32 x i32], [32 x i32]* @init, i64 0, i64 1), align 8
@j = internal unnamed_addr global i32 0, align 4
@i = internal unnamed_addr global i32 3, align 4
@init = internal global [32 x i32] [i32 0, i32 1481765933, i32 -1062105905, i32 -877267386, i32 -956092119, i32 812669700, i32 553475508, i32 -1702133896, i32 1344887256, i32 -1417066392, i32 1812158119, i32 -1999783937, i32 -1267215297, i32 1889772843, i32 -1461404943, i32 -41729540, i32 -1964937255, i32 1949118330, i32 220137366, i32 1979932169, i32 1089957932, i32 1873226917, i32 -1431813801, i32 1486937972, i32 -951450780, i32 -1370276668, i32 68706223, i32 1843638549, i32 212567592, i32 -263995484, i32 964776169, i32 928126551], align 16

; Function Attrs: nounwind optsize strictfp
define void @srandom(i32 noundef %0) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  tail call fastcc void @__srandom(i32 noundef %0) #4
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind optsize strictfp
define internal fastcc void @__srandom(i32 noundef %0) unnamed_addr #2 {
  %2 = load i32, i32* @n, align 4, !tbaa !3
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = load i32*, i32** @x, align 8, !tbaa !7
  store i32 %0, i32* %5, align 4, !tbaa !3
  br label %32

6:                                                ; preds = %1
  %7 = icmp eq i32 %2, 31
  %8 = icmp eq i32 %2, 7
  %9 = or i1 %7, %8
  %10 = select i1 %9, i32 3, i32 1
  store i32 %10, i32* @i, align 4, !tbaa !3
  store i32 0, i32* @j, align 4, !tbaa !3
  %11 = icmp sgt i32 %2, 0
  br i1 %11, label %14, label %12

12:                                               ; preds = %6
  %13 = load i32*, i32** @x, align 8, !tbaa !7
  br label %28

14:                                               ; preds = %6
  %15 = zext i32 %0 to i64
  %16 = load i32*, i32** @x, align 8, !tbaa !7
  %17 = zext i32 %2 to i64
  br label %18

18:                                               ; preds = %14, %18
  %19 = phi i64 [ 0, %14 ], [ %26, %18 ]
  %20 = phi i64 [ %15, %14 ], [ %22, %18 ]
  %21 = mul i64 %20, 6364136223846793005
  %22 = add i64 %21, 1
  %23 = lshr i64 %22, 32
  %24 = trunc i64 %23 to i32
  %25 = getelementptr inbounds i32, i32* %16, i64 %19
  store i32 %24, i32* %25, align 4, !tbaa !3
  %26 = add nuw nsw i64 %19, 1
  %27 = icmp eq i64 %26, %17
  br i1 %27, label %28, label %18

28:                                               ; preds = %18, %12
  %29 = phi i32* [ %13, %12 ], [ %16, %18 ]
  %30 = load i32, i32* %29, align 4, !tbaa !3
  %31 = or i32 %30, 1
  store i32 %31, i32* %29, align 4, !tbaa !3
  br label %32

32:                                               ; preds = %28, %4
  ret void
}

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @initstate(i32 noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ult i64 %2, 8
  br i1 %4, label %35, label %5

5:                                                ; preds = %3
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %6 = load i32, i32* @n, align 4, !tbaa !3
  %7 = shl i32 %6, 16
  %8 = load i32, i32* @i, align 4, !tbaa !3
  %9 = shl i32 %8, 8
  %10 = or i32 %9, %7
  %11 = load i32, i32* @j, align 4, !tbaa !3
  %12 = or i32 %10, %11
  %13 = load i32*, i32** @x, align 8, !tbaa !7
  %14 = getelementptr inbounds i32, i32* %13, i64 -1
  store i32 %12, i32* %14, align 4, !tbaa !3
  %15 = bitcast i32* %14 to i8*
  %16 = icmp ult i64 %2, 32
  br i1 %16, label %25, label %17

17:                                               ; preds = %5
  %18 = icmp ult i64 %2, 64
  br i1 %18, label %25, label %19

19:                                               ; preds = %17
  %20 = icmp ult i64 %2, 128
  br i1 %20, label %25, label %21

21:                                               ; preds = %19
  %22 = icmp ult i64 %2, 256
  %23 = select i1 %22, i32 31, i32 63
  %24 = select i1 %22, i32 2031616, i32 4128768
  br label %25

25:                                               ; preds = %21, %19, %17, %5
  %26 = phi i32 [ 0, %5 ], [ 7, %17 ], [ 15, %19 ], [ %23, %21 ]
  %27 = phi i32 [ 0, %5 ], [ 458752, %17 ], [ 983040, %19 ], [ %24, %21 ]
  store i32 %26, i32* @n, align 4, !tbaa !3
  %28 = getelementptr inbounds i8, i8* %1, i64 4
  store i8* %28, i8** bitcast (i32** @x to i8**), align 8, !tbaa !7
  tail call fastcc void @__srandom(i32 noundef %0) #4
  %29 = load i32, i32* @i, align 4, !tbaa !3
  %30 = shl i32 %29, 8
  %31 = or i32 %30, %27
  %32 = load i32, i32* @j, align 4, !tbaa !3
  %33 = or i32 %31, %32
  %34 = bitcast i8* %1 to i32*
  store i32 %33, i32* %34, align 4, !tbaa !3
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  br label %35

35:                                               ; preds = %3, %25
  %36 = phi i8* [ %15, %25 ], [ null, %3 ]
  ret i8* %36
}

; Function Attrs: nounwind optsize strictfp
define nonnull i8* @setstate(i8* noundef %0) local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %2 = load i32, i32* @n, align 4, !tbaa !3
  %3 = shl i32 %2, 16
  %4 = load i32, i32* @i, align 4, !tbaa !3
  %5 = shl i32 %4, 8
  %6 = or i32 %5, %3
  %7 = load i32, i32* @j, align 4, !tbaa !3
  %8 = or i32 %6, %7
  %9 = load i32*, i32** @x, align 8, !tbaa !7
  %10 = getelementptr inbounds i32, i32* %9, i64 -1
  store i32 %8, i32* %10, align 4, !tbaa !3
  %11 = bitcast i32* %10 to i8*
  %12 = bitcast i8* %0 to i32*
  %13 = getelementptr inbounds i8, i8* %0, i64 4
  store i8* %13, i8** bitcast (i32** @x to i8**), align 8, !tbaa !7
  %14 = load i32, i32* %12, align 4, !tbaa !3
  %15 = lshr i32 %14, 16
  store i32 %15, i32* @n, align 4, !tbaa !3
  %16 = lshr i32 %14, 8
  %17 = and i32 %16, 255
  store i32 %17, i32* @i, align 4, !tbaa !3
  %18 = and i32 %14, 255
  store i32 %18, i32* @j, align 4, !tbaa !3
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  ret i8* %11
}

; Function Attrs: nounwind optsize strictfp
define i64 @random() local_unnamed_addr #0 {
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  %1 = load i32, i32* @n, align 4, !tbaa !3
  %2 = icmp eq i32 %1, 0
  %3 = load i32*, i32** @x, align 8, !tbaa !7
  br i1 %2, label %4, label %9

4:                                                ; preds = %0
  %5 = load i32, i32* %3, align 4, !tbaa !3
  %6 = mul i32 %5, 1103515245
  %7 = add i32 %6, 12345
  %8 = and i32 %7, 2147483647
  store i32 %8, i32* %3, align 4, !tbaa !3
  br label %26

9:                                                ; preds = %0
  %10 = load i32, i32* @j, align 4, !tbaa !3
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %3, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !3
  %14 = load i32, i32* @i, align 4, !tbaa !3
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %3, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !3
  %18 = add i32 %17, %13
  store i32 %18, i32* %16, align 4, !tbaa !3
  %19 = lshr i32 %18, 1
  %20 = add nsw i32 %14, 1
  %21 = icmp eq i32 %20, %1
  %22 = select i1 %21, i32 0, i32 %20
  store i32 %22, i32* @i, align 4
  %23 = add nsw i32 %10, 1
  %24 = icmp eq i32 %23, %1
  %25 = select i1 %24, i32 0, i32 %23
  store i32 %25, i32* @j, align 4
  br label %26

26:                                               ; preds = %9, %4
  %27 = phi i32 [ %8, %4 ], [ %19, %9 ]
  %28 = zext i32 %27 to i64
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @lock, i64 0, i64 0)) #3
  ret i64 %28
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
