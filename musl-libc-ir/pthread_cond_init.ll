; ModuleID = 'src/thread/pthread_cond_init.c'
source_filename = "src/thread/pthread_cond_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pthread_cond_t = type { %union.anon }
%union.anon = type { [6 x i8*] }
%struct.pthread_condattr_t = type { i32 }

; Function Attrs: mustprogress nofree nounwind optsize strictfp willreturn
define i32 @pthread_cond_init(%struct.pthread_cond_t* noalias noundef writeonly %0, %struct.pthread_condattr_t* noalias noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca [6 x i8*], align 8
  %4 = bitcast [6 x i8*]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) %4, i8 0, i64 48, i1 false)
  %5 = bitcast %struct.pthread_cond_t* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* nonnull align 8 %4, i64 48, i1 true), !tbaa.struct !3
  %6 = icmp eq %struct.pthread_condattr_t* %1, null
  br i1 %6, label %16, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.pthread_condattr_t, %struct.pthread_condattr_t* %1, i64 0, i32 0
  %9 = load i32, i32* %8, align 4, !tbaa !7
  %10 = and i32 %9, 2147483647
  %11 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 2
  %12 = bitcast i8** %11 to i32*
  store i32 %10, i32* %12, align 8, !tbaa !4
  %13 = icmp sgt i32 %9, -1
  br i1 %13, label %16, label %14

14:                                               ; preds = %7
  %15 = getelementptr inbounds %struct.pthread_cond_t, %struct.pthread_cond_t* %0, i64 0, i32 0, i32 0, i64 0
  store i8* inttoptr (i64 -1 to i8*), i8** %15, align 8, !tbaa !4
  br label %16

16:                                               ; preds = %7, %14, %2
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { mustprogress nofree nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 48, !4, i64 0, i64 48, !4, i64 0, i64 48, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 0}
!8 = !{!"", !9, i64 0}
!9 = !{!"int", !5, i64 0}
