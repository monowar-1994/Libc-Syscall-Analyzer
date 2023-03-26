; ModuleID = 'src/stdio/tempnam.c'
source_filename = "src/stdio/tempnam.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kstat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }

@.str = private unnamed_addr constant [5 x i8] c"/tmp\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"temp\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @tempnam(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [4096 x i8], align 16
  %4 = alloca %struct.kstat, align 8
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %5) #5
  %6 = icmp eq i8* %0, null
  %7 = select i1 %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* %0
  %8 = icmp eq i8* %1, null
  %9 = select i1 %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8* %1
  %10 = tail call i64 @strlen(i8* noundef %7) #6
  %11 = tail call i64 @strlen(i8* noundef %9) #6
  %12 = add i64 %10, 1
  %13 = add i64 %12, %11
  %14 = add i64 %13, 7
  %15 = icmp ugt i64 %14, 4095
  br i1 %15, label %16, label %18

16:                                               ; preds = %2
  %17 = tail call i32* @___errno_location() #7
  store i32 36, i32* %17, align 4, !tbaa !3
  br label %40

18:                                               ; preds = %2
  %19 = call i8* @memcpy(i8* noundef nonnull %5, i8* noundef %7, i64 noundef %10) #6
  %20 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 %10
  store i8 47, i8* %20, align 1, !tbaa !7
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  %22 = call i8* @memcpy(i8* noundef nonnull %21, i8* noundef %9, i64 noundef %11) #6
  %23 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 %13
  store i8 95, i8* %23, align 1, !tbaa !7
  %24 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 %14
  store i8 0, i8* %24, align 1, !tbaa !7
  %25 = getelementptr inbounds i8, i8* %24, i64 -6
  %26 = ptrtoint [4096 x i8]* %3 to i64
  %27 = bitcast %struct.kstat* %4 to i8*
  %28 = ptrtoint %struct.kstat* %4 to i64
  br label %32

29:                                               ; preds = %32
  %30 = add nuw nsw i32 %33, 1
  %31 = icmp eq i32 %30, 100
  br i1 %31, label %40, label %32

32:                                               ; preds = %18, %29
  %33 = phi i32 [ 0, %18 ], [ %30, %29 ]
  %34 = call i8* @__randname(i8* noundef nonnull %25) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(144) %27, i8 0, i64 144, i1 false) #8
  %35 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 6, i64 %26, i64 %28) #5, !srcloc !8
  %36 = trunc i64 %35 to i32
  %37 = icmp eq i32 %36, -2
  br i1 %37, label %38, label %29

38:                                               ; preds = %32
  %39 = call i8* @strdup(i8* noundef nonnull %5) #6
  br label %40

40:                                               ; preds = %29, %38, %16
  %41 = phi i8* [ null, %16 ], [ %39, %38 ], [ null, %29 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %5) #5
  ret i8* %41
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__randname(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare i8* @strdup(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{i64 148907}
