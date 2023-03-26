; ModuleID = 'src/network/gethostbyname2.c'
source_filename = "src/network/gethostbyname2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }

@gethostbyname2.h = internal unnamed_addr global %struct.hostent* null, align 8

; Function Attrs: nounwind optsize strictfp
define %struct.hostent* @gethostbyname2(i8* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.hostent*, align 8
  %4 = bitcast %struct.hostent** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  br label %5

5:                                                ; preds = %14, %2
  %6 = phi i64 [ 63, %2 ], [ %9, %14 ]
  %7 = load i8*, i8** bitcast (%struct.hostent** @gethostbyname2.h to i8**), align 8, !tbaa !3
  call void @free(i8* noundef %7) #5
  %8 = shl i64 %6, 1
  %9 = or i64 %8, 1
  %10 = call i8* @malloc(i64 noundef %9) #5
  store i8* %10, i8** bitcast (%struct.hostent** @gethostbyname2.h to i8**), align 8, !tbaa !3
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %5
  %13 = tail call i32* @__h_errno_location() #6
  store i32 3, i32* %13, align 4, !tbaa !7
  br label %25

14:                                               ; preds = %5
  %15 = bitcast i8* %10 to %struct.hostent*
  %16 = getelementptr inbounds i8, i8* %10, i64 32
  %17 = add i64 %8, -31
  %18 = tail call i32* @__h_errno_location() #6
  %19 = call i32 @gethostbyname2_r(i8* noundef %0, i32 noundef %1, %struct.hostent* noundef nonnull %15, i8* noundef nonnull %16, i64 noundef %17, %struct.hostent** noundef nonnull %3, i32* noundef %18) #5
  %20 = icmp eq i32 %19, 34
  br i1 %20, label %5, label %21

21:                                               ; preds = %14
  %22 = icmp eq i32 %19, 0
  %23 = load %struct.hostent*, %struct.hostent** @gethostbyname2.h, align 8
  %24 = select i1 %22, %struct.hostent* %23, %struct.hostent* null
  br label %25

25:                                               ; preds = %21, %12
  %26 = phi %struct.hostent* [ %24, %21 ], [ null, %12 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret %struct.hostent* %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare i32* @__h_errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @gethostbyname2_r(i8* noundef, i32 noundef, %struct.hostent* noundef, i8* noundef, i64 noundef, %struct.hostent** noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
