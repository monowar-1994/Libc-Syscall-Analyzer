; ModuleID = 'src/thread/mtx_init.c'
source_filename = "src/thread/mtx_init.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.mtx_t = type { %union.anon }
%union.anon = type { [5 x i8*] }

; Function Attrs: nofree nounwind optsize strictfp
define i32 @mtx_init(%struct.mtx_t* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 8
  %4 = alloca [36 x i8], align 4
  %5 = getelementptr inbounds [36 x i8], [36 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(36) %5, i8 0, i64 36, i1 false)
  %6 = and i32 %1, 1
  store i32 %6, i32* %3, align 8, !tbaa !3
  %7 = bitcast %struct.mtx_t* %0 to i32*
  %8 = load volatile i32, i32* %3, align 8, !tbaa.struct !7
  store volatile i32 %8, i32* %7, align 8, !tbaa.struct !7
  %9 = bitcast %struct.mtx_t* %0 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %10, i8* nonnull align 4 %5, i64 36, i1 true), !tbaa.struct !9
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 0, i64 40, !8, i64 0, i64 40, !8, i64 0, i64 40, !8}
!8 = !{!5, !5, i64 0}
!9 = !{i64 0, i64 36, !8, i64 0, i64 36, !8, i64 0, i64 36, !8}
